package blok.html;

import js.html.Event;

typedef EventListener = (e:Event)->Void; 

// From https://github.com/haxetink/tink_domspec/blob/master/src/tink/domspec/Events.hx
typedef HtmlEvents = {
  @:optional final onwheel:EventListener;
  
  @:optional final oncopy:EventListener;
  @:optional final oncut:EventListener;
  @:optional final onpaste:EventListener;
  
  @:optional final onabort:EventListener;
  @:optional final onblur:EventListener;
  @:optional final onfocus:EventListener;
  
  @:optional final oncanplay:EventListener;
  @:optional final oncanplaythrough:EventListener;
  @:optional final onchange:EventListener;
  
  @:optional final onclick:EventListener;
  @:optional final oncontextmenu:EventListener;
  @:optional final ondblclick:EventListener;
  
  @:optional final ondrag:EventListener;
  @:optional final ondragend:EventListener;
  @:optional final ondragenter:EventListener;
  @:optional final ondragleave:EventListener;
  @:optional final ondragover:EventListener;
  @:optional final ondragstart:EventListener;
  @:optional final ondrop:EventListener;
  
  @:optional final ondurationchange:EventListener;
  @:optional final onemptied:EventListener;
  @:optional final onended:EventListener;
  @:optional final oninput:EventListener;
  @:optional final oninvalid:EventListener;
  
  @:optional final oncompositionstart:EventListener;
  @:optional final oncompositionupdate:EventListener;
  @:optional final oncompositionend:EventListener;
  
  @:optional final onkeydown:EventListener;
  @:optional final onkeypress:EventListener;
  @:optional final onkeyup:EventListener;
  
  @:optional final onload:EventListener;
  @:optional final onloadeddata:EventListener;
  @:optional final onloadedmetadata:EventListener;
  @:optional final onloadstart:EventListener;
  
  @:optional final onmousedown:EventListener;
  @:optional final onmouseenter:EventListener;
  @:optional final onmouseleave:EventListener;
  @:optional final onmousemove:EventListener;
  @:optional final onmouseout:EventListener;
  @:optional final onmouseover:EventListener;
  @:optional final onmouseup:EventListener;
  
  @:optional final onpause:EventListener;
  @:optional final onplay:EventListener;
  @:optional final onplaying:EventListener;
  @:optional final onprogress:EventListener;
  @:optional final onratechange:EventListener;
  @:optional final onreset:EventListener;
  @:optional final onresize:EventListener;
  @:optional final onscroll:EventListener;
  @:optional final onseeked:EventListener;
  @:optional final onseeking:EventListener;
  @:optional final onselect:EventListener;
  @:optional final onshow:EventListener;
  @:optional final onstalled:EventListener;
  @:optional final onsubmit:EventListener;
  @:optional final onsuspend:EventListener;
  @:optional final ontimeupdate:EventListener;
  @:optional final onvolumechange:EventListener;
  @:optional final onwaiting:EventListener;
  
  @:optional final onpointercancel:EventListener;
  @:optional final onpointerdown:EventListener;
  @:optional final onpointerup:EventListener;
  @:optional final onpointermove:EventListener;
  @:optional final onpointerout:EventListener;
  @:optional final onpointerover:EventListener;
  @:optional final onpointerenter:EventListener;
  @:optional final onpointerleave:EventListener;
  
  @:optional final ongotpointercapture:EventListener;
  @:optional final onlostpointercapture:EventListener;
  @:optional final onfullscreenchange:EventListener;
  @:optional final onfullscreenerror:EventListener;
  @:optional final onpointerlockchange:EventListener;
  @:optional final onpointerlockerror:EventListener;
  
  @:optional final onerror:EventListener;
  
  @:optional final ontouchstart:EventListener;
  @:optional final ontouchend:EventListener;
  @:optional final ontouchmove:EventListener;
  @:optional final ontouchcancel:EventListener;
}
