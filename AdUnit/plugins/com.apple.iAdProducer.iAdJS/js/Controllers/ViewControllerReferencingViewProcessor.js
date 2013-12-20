
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.Class({name:"iAd.ViewControllerReferencingViewProcessor",superclass:iAd.ViewProcessor});iAd.ViewControllerReferencingViewProcessor.prototype.init=function(a){this.callSuper(a);this.anchors=[]};iAd.ViewControllerReferencingViewProcessor.prototype.processView=function(b){var f=this.constructor.PROCESSED_KEY;var a=this.constructor.ATTR_NAME;var e=iAd.Element.HTML5_CUSTOM_ATTRIBUTE_PREFIX+a;var c;var h=b.layer.querySelectorAll("["+e+"],["+a+"]");for(var d=0,g=h.length;d<g;d++){c=h[d];if(c.hasOwnProperty(f)){continue}c.addEventListener(iAd.View.TOUCH_UP_INSIDE_EVENT,this,false);c.addEventListener("click",this,false);c[f]=true;this.anchors.push(c)}};iAd.ViewControllerReferencingViewProcessor.prototype.cleanUp=function(){var b=this.constructor.PROCESSED_KEY;var a;while(this.anchors.length){a=this.anchors.pop();a.removeEventListener(iAd.View.TOUCH_UP_INSIDE_EVENT,this,false);a.removeEventListener("click",this,false);delete a[b]}};iAd.ViewControllerReferencingViewProcessor.prototype.shouldHandleEvent=function(b){var a=b.currentTarget;if(!iAd.Element.hasCustomAttribute(a,this.constructor.ATTR_NAME)){return false}if(b.type=="click"&&iAd.Control.isNodeInControlHierarchyBoundedByElement(b.target,a)){return false}return true};