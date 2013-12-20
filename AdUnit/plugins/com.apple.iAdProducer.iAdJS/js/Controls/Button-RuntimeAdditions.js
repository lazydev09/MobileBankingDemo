
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

(function(){iAd.Class.processMethod(iAd.Button,"init");var b=iAd.Button.prototype.init;iAd.Class.processMethod(iAd.Button,"setValueForAttribute");var a=iAd.Button.prototype.setValueForAttribute;iAd.Button.prototype.init=function(c,d){b.call(this,c,d||iAd.Button.TYPE_CUSTOM)};iAd.Button.prototype.setValueForAttribute=function(d,c){if(c=="ad-title"){this.setTitleForState(d,iAd.Control.STATE_NORMAL)}else{if(c=="ad-vertical-alignment"){if(this.titleLabel){this.titleLabel.verticalAlignment=d}}else{a.apply(this,arguments)}}}})();