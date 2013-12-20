
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.Object.prototype.registerAnalytics=function(b,a){iAd.Analytics.registerMessageForEvent(a,b,this)};iAd.Object.prototype.unregisterAnalytics=function(b,a){iAd.Analytics.unregisterMessageForEvent(a,b,this)};