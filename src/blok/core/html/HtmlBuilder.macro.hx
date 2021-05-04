package blok.core.html;

import haxe.macro.Type;
import haxe.macro.Expr;
import haxe.macro.Context;
import blok.core.BuilderHelpers;

using haxe.macro.Tools;

enum abstract TagKind(String) to String {
  var TagVoid = 'void';
  var TagNormal = 'normal';
  var TagOpaque = 'opaque';
}

typedef TagInfo = {
  name:String,
  kind:TagKind,
  type:Type  
}

class HtmlBuilder {
  public static function build(
    tagPath:String,
    nodeTypePath:String,
    realNodeType:Expr, 
    ?prefix:String
  ) {
    var nodeType = BuilderHelpers.extractComplexTypeFromExpr(realNodeType);
    var fields = Context.getBuildFields();
    var nt = macro $p{nodeTypePath.split('.')};
    var tags = getTags(tagPath);

    for (tag in tags) switch tag.kind {
      case TagNormal:
        var name = tag.name;
        var type = tag.type.toComplexType();
        fields = fields.concat((macro class {
          public static inline function $name(
            props:blok.core.html.HtmlBaseProps.HtmlChildrenProps<$type & blok.core.html.HtmlEvents, $nodeType>
          ):blok.VNode {
            return VComponent(
              ${nt}.get($v{prefix != null ? '$prefix:${tag.name}' : name}),
              props
            );
          }
        }).fields);

      default:
        var name = tag.name;
        var type = tag.type.toComplexType();
        fields = fields.concat((macro class {
          public static inline function $name(
            props:blok.core.html.HtmlBaseProps<$type & blok.core.html.HtmlEvents, $nodeType>
          ):blok.VNode {
            return VComponent(
              ${nt}.get($v{prefix != null ? '$prefix:${tag.name}' : name}),
              {
                attrs: props.attrs,
                ref: props.ref
              }
            );
          }
        }).fields);
    }

    return fields;
  }

  static function getTags(tagPath:String):Array<TagInfo> {
    var tags:Array<TagInfo> = [];
    var t = Context.getType(tagPath);
    var groups = switch t {
      case TType(t, params): switch (t.get().type) {
        case TAnonymous(a): a.get().fields;
        default: throw 'assert';
      }
      default:
        throw 'assert';
    }

    for (group in groups) {
      var kind:TagKind = cast group.name;
      var fields = switch group.type {
        case TAnonymous(a): a.get().fields;
        default: throw 'assert';
      }
      for (f in fields) {
        tags.push({
          name: f.name,
          type: f.type,
          kind: kind
        });
      }
    }

    return tags;
  }
}