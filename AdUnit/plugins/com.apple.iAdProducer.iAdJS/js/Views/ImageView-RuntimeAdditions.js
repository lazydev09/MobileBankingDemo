
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

(function(){iAd.ImageView.prototype.setImagePosition=function(b){if(this._imagePosition==b){return}this._imagePosition=b;this.syncImageToCurrentState()};iAd.ImageView.prototype.setImageSize=function(b){if(this._imageSize==b){return}this._imageSize=b;this.syncImageToCurrentState()};iAd.ImageView.prototype.setImageRepeat=function(b){if(this._imageRepeat==b){return}this._imageRepeat=b;this.syncImageToCurrentState()};iAd.ImageView.prototype.setSize=function(b){if(this._size.equals(b)){return}this.callSuper(b);if(!this._usingFallback){this.syncImageToCurrentState()}};iAd.Class.processMethod(iAd.ImageView,"syncImageToCurrentState");var a=iAd.ImageView.prototype.syncImageToCurrentState;iAd.ImageView.prototype.syncImageToCurrentState=function(){a.apply(this,arguments);var c=(this.highlighted?this.highlightedImage:this.image);if(!this._imagePosition||!this._imageSize||!c){return}if(!this._imageRepeat){this._imageRepeat="no-repeat"}if(this.usesBackgroundImage||iAd.ImageView.usesBackgroundImage||this._imageSize=="contain"||this._imageSize=="cover"||this._imagePosition.indexOf("center")!=-1||this._imagePosition.indexOf("right")!=-1||this._imagePosition.indexOf("bottom")!=-1||this._imageRepeat!="no-repeat"||this._hasBorderRadius){this._img.style.display="none";if(this._backgroundImageSrc!=c.element.src){this.layer.style.backgroundImage="url("+c.element.src+")";this._backgroundImageSrc=c.element.src}this.layer.style.backgroundSize=this._imageSize;this.layer.style.backgroundPosition=this._imagePosition;this.layer.style.backgroundRepeat=this._imageRepeat;this._usingFallback=true}else{if(this._img.style.display=="none"){this._img.style.display="block";this.layer.style.backgroundImage="";this.layer.style.backgroundPosition="";this.layer.style.backgroundRepeat="";this.layer.style.backgroundSize="";this._backgroundImageSrc=null}var d=this._imageSize.split(" ");if(d.length==2){this._img.style.width=d[0];this._img.style.height=d[1]}var b=this._imagePosition.split(" ");if(b.length==2){this._img.style.left=(b[0]=="left"?"0px":b[0]);this._img.style.top=(b[1]=="top"?"0px":b[1])}this._usingFallback=false}};iAd.ImageView.prototype.readPropertiesFromLayerComputedStyle=function(b){this.callSuper(b);this.updateBorderRadius()};iAd.ImageView.prototype.updateBorderRadius=function(b){if(!b){b=window.getComputedStyle(this.layer)}this._hasBorderRadius=(parseFloat(b.borderTopRightRadius)>0||parseFloat(b.borderTopLeftRadius)>0||parseFloat(b.borderBottomRightRadius)>0||parseFloat(b.borderBottomLeftRadius)>0)};iAd.Class.synthesizeProperty(iAd.ImageView.prototype,"imagePosition");iAd.Class.synthesizeProperty(iAd.ImageView.prototype,"imageSize");iAd.Class.synthesizeProperty(iAd.ImageView.prototype,"imageRepeat");iAd.ImageView.archivedProperties.push("imagePosition");iAd.ImageView.archivedProperties.push("imageSize");iAd.ImageView.archivedProperties.push("imageRepeat")}());