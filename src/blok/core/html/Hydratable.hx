package blok.core.html;

interface Hydratable {
  #if blok.platform.dom
    public function hydrate(firstNode:js.html.Node, registerEffect:(effect:()->Void)->Void):Void;
  #end
}