package blok.core.html;

interface Hydratable {
  #if blok.platform.dom
    public function hydrate(
      firstNode:js.html.Node,
      registerEffect:(effect:()->Void)->Void,
      next:(widget:Widget)->Void
    ):Void;
  #end
}
