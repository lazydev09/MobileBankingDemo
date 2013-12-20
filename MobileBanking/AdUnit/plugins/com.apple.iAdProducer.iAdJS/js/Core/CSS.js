
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.CSS={};iAd.CSS.t=function(b,a){return iAd.CSS.t3d(b,a,0)};iAd.CSS.t3d=function(b,a,c){return"translate3d("+b+"px, "+a+"px, "+c+"px)"};iAd.CSS.r3d=function(a,d,c,b){return"rotate3d("+a+", "+d+", "+c+", "+b+"rad)"};iAd.CSS.roundedPxValue=function(b){var a=window.devicePixelRatio;return((b*a)|0)/a};iAd.CSS.tm=function(b,a){return"matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, "+b+", "+a+", 0, 1)"};iAd.CSS.matrixFromString=function(a){var b="";if(a.length>0&&a!="none"){b=a.replace(/([^(]*)\(([^)]*)\)/g,function(d,f,e){var c=e.replace(/(\-?[0-9.]+(?:e\-?[0-9]+)?)([^,]*)/g,function(h,i,g){i=parseFloat(i);return i.toFixed(6)+g});return f+"("+c+")"})}return new WebKitCSSMatrix(b)};iAd.CSS.concatenateTransforms=function(){var d=[];for(var b=0,c=arguments.length;b<c;b++){var a=arguments[b];if(a&&a!="none"){d.push(a)}}return d.join(" ")};iAd.CSS.isClassNameValid=function(a){return a!=null&&a!=""&&a===String(a).replace(/\s/g,"")};iAd.CSS.matrixEqualsToMatrix=function(c,a){for(var e=1;e<=4;e++){for(var b=1;b<=4;b++){var d="m"+e+b;if(c[d]!==a[d]){return false}}}return true};iAd.CSS.widthForTextAndFont=function(b,a){if(!this.textMeasuringCanvasContext){this.textMeasuringCanvasContext=document.createElement("canvas").getContext("2d")}if(a){this.textMeasuringCanvasContext.font=a}return this.textMeasuringCanvasContext.measureText(b).width};iAd.CSS.isStyleSheetLoaded=function(a){return(iAd.CSS.elementForStyleSheet(a)!=null)};iAd.CSS.elementForStyleSheet=function(a){var c,e=document.styleSheets;for(var b=0,d=e.length;b<d;b++){c=e[b];if(c.href==a){return c}}return null};iAd.CSS.flushPendingUpdates=function(){document.body.offsetWidth};iAd.Utils.setupDisplayNames(iAd.CSS,"iAd.CSS");