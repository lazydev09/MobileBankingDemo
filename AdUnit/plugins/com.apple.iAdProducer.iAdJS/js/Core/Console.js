
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.Console={};iAd.Console.log=function(){if(window.console&&console.log){console.log.apply(console,arguments)}};iAd.Console._log=function(b,a){if(window.console&&console[b]){console[b].apply(console,a)}else{a=Array.prototype.slice.call(a);a.unshift(b.toUpperCase()+":");iAd.Console.log.apply(iAd.Console,a)}};iAd.Console.warn=function(){iAd.Console._log("warn",arguments)};iAd.Console.error=function(){iAd.Console._log("error",arguments)};iAd.Console.debug=function(){iAd.Console._log("debug",arguments)};iAd.Console.info=function(){iAd.Console._log("info",arguments)};