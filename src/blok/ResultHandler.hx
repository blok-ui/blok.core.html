package blok;

import blok.core.html.Hydratable;
#if blok.platform.dom
  import blok.dom.Hydrator.hydrateChildren;
#end

class ResultHandler<Data, Error> extends Component implements Hydratable {
  @prop var result:ObservableResult<Data, Error>;
  @prop var loading:()->VNode;
  @prop var build:(data:Data)->VNode;
  @prop var error:(err:Error)->VNode;

  #if blok.platform.dom
    public function hydrate(
      firstNode:js.html.Node,
      registerEffect:(effect:()->Void)->Void,
      next:()->Void
    ) {
      result.handle(result -> switch result {
        case Suspended:
          Pending;
        case Success(_) | Failure(_):
          hydrateChildren(
            this,
            __performRender().toArray(),
            getPlatform(),
            firstNode,
            registerEffect,
            next
          );
          Handled;
      });
    }
  #end

  function render() {
    return result.render(result -> switch result {
      case Suspended: loading();
      case Success(data): build(data);
      case Failure(e): error(e);
    });
  }
}
