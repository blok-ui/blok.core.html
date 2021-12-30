package blok.html;

// Taken from: https://github.com/haxetink/tink_domspec/blob/master/src/tink/domspec/Aria.hx
typedef AriaAttributes = {
  @:html('aria-label') @:optional final ariaLabel:String;
  @:html('aria-labeledby') @:optional final ariaLabelledby:String;
  @:html('aria-describedby') @:optional final ariaDescribedby:String;
  @:html('aria-autocomplete') @:optional final ariaAutocomplete:String;
  @:html('aria-dropeffect') @:optional final ariaDropEffect:String;
  @:html('aria-hidden') @:optional final ariaHidden:Bool;
  @:html('aria-disabled') @:optional final ariaDisabled:Bool;
  @:html('aria-checked') @:optional final ariaChecked:Bool;
  @:html('aria-haspopup') @:optional final ariaHasPopup:Bool;
  @:html('aria-grabbed') @:optional final ariaGrabbed:Bool;
  @:html('aria-valuenow') @:optional final ariaValuenow:Float;
  @:html('aria-valuemin') @:optional final ariaValuemin:Float;
  @:html('aria-valuemax') @:optional final ariaValuemax:Float;
  @:html('aria-valuetext') @:optional final ariaValuetext:String;
}
