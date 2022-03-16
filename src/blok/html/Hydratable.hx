package blok.html;

interface Hydratable {
  #if blok.platform.dom
    public function hydrate(
      firstNode:js.html.Node,
      effects:blok.ui.Effect,
      next:()->Void
    ):Void;
  #end
}
