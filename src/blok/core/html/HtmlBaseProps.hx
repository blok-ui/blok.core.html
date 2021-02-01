package blok.core.html;

import blok.core.Key;
import blok.core.VNode;

typedef HtmlBaseProps<Attrs:{}, RealNode> = {
  ?ref:(node:RealNode)->Void,
  ?key:Key,
  ?attrs:Attrs
}

typedef HtmlChildrenProps<Attrs:{}, RealNode> = HtmlBaseProps<Attrs, RealNode> & {
  ?children:Array<VNode<RealNode>>
}
