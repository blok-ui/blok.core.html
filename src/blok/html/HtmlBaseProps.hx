package blok.html;

import blok.Key;
import blok.VNode;

typedef HtmlBaseProps<Attrs:{}, RealNode> = {
  ?ref:(node:RealNode)->Void,
  ?key:Key,
  ?attrs:Attrs
}

typedef HtmlChildrenProps<Attrs:{}, RealNode> = HtmlBaseProps<Attrs, RealNode> & {
  ?children:Array<VNode>
}
