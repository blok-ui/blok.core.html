package blok.core.html;

import blok.tools.ClassBuilder;
import haxe.macro.Type;
import haxe.macro.Expr;
import haxe.macro.Context;
import blok.tools.BuilderHelpers;

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
    navtiveVNodeFactory:Expr, 
    ?prefix:String
  ) {
    var nodeType = BuilderHelpers.extractComplexTypeFromExpr(navtiveVNodeFactory);
    var builder = ClassBuilder.fromContext();
    var nt = macro $p{nodeTypePath.split('.')};
    var tags = getTags(tagPath);

    for (tag in tags) switch tag.kind {
      case TagNormal:
        var name = tag.name;
        var type = tag.type.toComplexType();
        builder.add(macro class {
          public static inline function $name(
            attrs:$type & blok.core.html.HtmlEvents & {
              ?key:Key,
              ?ref:(node:$nodeType)->Void,
            },
            ...children:VNode
          ):blok.VNode {
            return ${nt}.create(
              $v{prefix != null ? '$prefix:${tag.name}' : name}, {
                attrs: attrs,
                key: attrs.key,
                ref: attrs.ref,
                children: children.toArray()
              });
          }
        });

      default:
        var name = tag.name;
        var type = tag.type.toComplexType();
        builder.add(macro class {
          public static inline function $name(
            attrs:$type & blok.core.html.HtmlEvents & {
              ?key:Key,
              ?ref:(node:$nodeType)->Void,
            }
          ):blok.VNode {
            return ${nt}.create($v{prefix != null ? '$prefix:${tag.name}' : name}, {
              attrs: attrs,
              ref: attrs.ref,
              key: attrs.key
            });
          }
        });
    }

    return builder.export();
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