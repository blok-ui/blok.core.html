package blok.html;

import blok.ui.Key;
import blok.ui.VNode;

typedef HtmlBaseProps<Attrs:{}, RealNode> = {
  ?ref:(node:RealNode)->Void,
  ?key:Key,
  ?attrs:Attrs
}

typedef HtmlChildrenProps<Attrs:{}, RealNode> = HtmlBaseProps<Attrs, RealNode> & {
  ?children:Array<VNode>
}
