
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.Class({name:"iAd.OutletsViewProcessor",superclass:iAd.ViewProcessor});iAd.OutletsViewProcessor.prototype.init=function(a){this.callSuper(a);this.outlets=[]};iAd.OutletsViewProcessor.prototype.processView=function(b){var a="ad-outlet";var d=iAd.Element.HTML5_CUSTOM_ATTRIBUTE_PREFIX+a;var g;var f=b.layer.querySelectorAll("["+d+"],["+a+"]");for(var c=0,e=f.length;c<e;c++){g=f[c];if(g.hasOwnProperty("_adProcessedOutlet")){continue}this.viewController.outlets[iAd.Element.getCustomAttribute(g,a)]=(g.hasOwnProperty("_view"))?g._view:g;g._adProcessedOutlet=true;this.outlets.push(g)}};iAd.OutletsViewProcessor.prototype.cleanUp=function(){for(var a in this.viewController.outlets){delete this.viewController.outlets[a]}while(this.outlets.length){delete this.outlets.pop()._adProcessedOutlet}};iAd.ViewController.addViewProcessor(iAd.OutletsViewProcessor);