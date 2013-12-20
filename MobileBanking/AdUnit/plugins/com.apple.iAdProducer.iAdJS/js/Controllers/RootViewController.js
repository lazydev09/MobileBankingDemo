
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.Class({name:"iAd.RootViewController",superclass:iAd.ViewController,archivedProperties:["navigationController"]});iAd.RootViewController.ID="root";iAd.RootViewController.prototype.init=function(a){a=a||{};a.id=iAd.RootViewController.ID;if(a.requiredFileURIs){delete a.requiredFileURIs.contentView}this.callSuper(a);this.openBeginIgnoringInteractionEventsCalls=0;this.shouldArchiveView=false;iAd.RootViewController.sharedRootViewController=this};iAd.RootViewController.prototype.loadView=function(){this.view=iAd.RootView.sharedRoot};iAd.RootViewController.prototype.archiveProperty=function(a){if(a=="navigationController"){return this._navigationController}else{return this.callSuper(a)}};iAd.RootViewController.prototype.beginIgnoringInteractionEvents=function(){this.openBeginIgnoringInteractionEventsCalls++;if(this.openBeginIgnoringInteractionEventsCalls==1){this.view.layer.style.pointerEvents="none"}};iAd.RootViewController.prototype.endIgnoringInteractionEvents=function(){if(this.openBeginIgnoringInteractionEventsCalls==0){return}this.openBeginIgnoringInteractionEventsCalls--;if(this.openBeginIgnoringInteractionEventsCalls==0){this.view.layer.style.pointerEvents="auto"}};iAd.RootViewController.prototype.isIgnoringInteractionEvents=function(){return(this.openBeginIgnoringInteractionEventsCalls>0)};Object.defineProperty(iAd.RootViewController,"sharedRootViewController",{get:function(){if(!iAd.RootViewController.hasOwnProperty("_sharedRootViewController")){var a=new iAd.RootViewController();iAd.RootViewController.sharedRootViewController=a;a.view}return iAd.RootViewController._sharedRootViewController},set:function(a){iAd.RootViewController._sharedRootViewController=a}});