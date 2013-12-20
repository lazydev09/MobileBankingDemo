
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.Class.synthesizeProperty(iAd.View.prototype,"renderedFrame");iAd.View.archivedProperties.push("renderedFrame");iAd.View.prototype.forceRedraw=function(){var a=this.layer.style.display;this.layer.style.display="none";this.layer.offsetHeight=this.layer.offsetHeight;this.layer.style.display=a};iAd.View.prototype.detectHostingLayer=function(){var b=this.layer.children;for(var a=0,c=b.length;a<c;a++){if(b[a].hasClassName("ad-hosting-layer")){return b[a]}}return null};iAd.View.prototype.getRenderedFrame=function(){var a=document.defaultView.getComputedStyle(this.layer);var b=iAd.CSS.matrixFromString(a.webkitTransform);var c=new iAd.Rect(parseInt(a.left,10)+b.m41,parseInt(a.top,10)+b.m42,parseInt(a.width,10),parseInt(a.height,10));return c};iAd.View.prototype.viewDidAppear=function(){var c=this.subviews;for(var a=0,b=c.length;a<b;a++){c[a].viewDidAppear()}};