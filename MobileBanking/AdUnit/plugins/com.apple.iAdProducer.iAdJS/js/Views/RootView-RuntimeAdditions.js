
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

(function(){iAd.Class.processMethod(iAd.RootView,"init");var a=iAd.RootView.prototype.init;iAd.RootView.prototype.init=function(b){a.apply(this,arguments);if(!iAd.Utils.isRunningInAdContext){window.removeEventListener("resize",this,true)}}})();