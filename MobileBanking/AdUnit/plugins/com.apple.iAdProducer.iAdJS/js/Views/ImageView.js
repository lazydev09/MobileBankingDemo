
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.Class({name:"iAd.ImageView",superclass:iAd.View,synthesizedProperties:["autoSized","image","highlightedImage","highlighted"],archivedProperties:["autoSized","image","highlightedImage","highlighted"],cssClassName:"ad-image-view",collectionAccessor:"imageViews"});iAd.ImageView.prototype.init=function(a){this._autoSized=true;this._highlighted=false;this._image=null;this._highlightedImage=null;this.callSuper(a);this.addEventListener(iAd.View.TOUCH_DOWN_EVENT,this,false);this.addEventListener(iAd.View.TOUCH_DRAG_ENTER_EVENT,this,false);this.addEventListener(iAd.View.TOUCH_DRAG_EXIT_EVENT,this,false);this.addEventListener(iAd.View.TOUCH_UP_INSIDE_EVENT,this,false);this.addEventListener(iAd.View.TOUCH_CANCEL_EVENT,this,false)};iAd.ImageView.prototype.layerWasCreated=function(){this._img=this.layer.appendChild(document.createElement("img"))};iAd.ImageView.prototype.setValueForAttribute=function(b,a){switch(a){case"ad-image":this.image=iAd.Image.imageForURL(b,this.layerHasCustomAttribute("ad-has-hidpi-version"));break;case"ad-highlighted-image":this.highlightedImage=iAd.Image.imageForURL(b,this.layerHasCustomAttribute("ad-has-hidpi-version"));break;default:this.callSuper(b,a)}};iAd.ImageView.prototype.layerWasInsertedIntoDocument=function(){this.callSuper();this.syncImageToCurrentState()};iAd.ImageView.prototype.setImage=function(a){this._image=a;this.syncImageToCurrentState()};iAd.ImageView.prototype.setHighlightedImage=function(a){this.userInteractionEnabled=(a!=null);this._highlightedImage=a;this.syncImageToCurrentState()};iAd.ImageView.prototype.setHighlighted=function(a){if(a==this._highlighted){return}this._highlighted=a;this.syncImageToCurrentState()};iAd.ImageView.prototype.setAutoSized=function(a){if(this._autoSized==a){return}this._autoSized=a;this.syncImageToCurrentState()};iAd.ImageView.prototype.syncImageToCurrentState=function(){var a=(this.highlighted&&this.highlightedImage)?this.highlightedImage:this.image;if(!a){this._img.src="";this._img.style.removeProperty("visibility");return}if(!a.loaded){a.addPropertyObserver("loaded",this,"syncImageToCurrentState");return}this._img.style.visibility="visible";this._img.src=a.element.src;if(this._autoSized){this.size=new iAd.Size(a.width,a.height)}if(iAd.ImageEffects&&this._effect){this._effect.inputImage=this._img;this._effect.render()}};iAd.ImageView.prototype.handleEvent=function(a){this.callSuper(a);switch(a.type){case iAd.View.TOUCH_DOWN_EVENT:case iAd.View.TOUCH_DRAG_ENTER_EVENT:this.highlighted=true;break;case iAd.View.TOUCH_DRAG_EXIT_EVENT:case iAd.View.TOUCH_UP_INSIDE_EVENT:case iAd.View.TOUCH_CANCEL_EVENT:this.highlighted=false;break}};