
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.Class({name:"iAd.ViewControllerRequiredFilesLoader",superclass:iAd.LoaderBatch,synthesizedProperties:["contentViewMarkup"]});iAd.ViewControllerRequiredFilesLoader.LOADER_CLASSES={stylesheets:iAd.StyleLoader,scripts:iAd.ScriptLoader,images:iAd.ImageLoader,contentView:iAd.XHRLoader};iAd.ViewControllerRequiredFilesLoader.prototype.init=function(a){this.callSuper();this.viewController=a;var b=a.configuration;if(b.requiredFileURIs){this.processFiles(b.requiredFileURIs)}};iAd.ViewControllerRequiredFilesLoader.prototype.getContentViewMarkup=function(){return this.contentViewLoader.content};iAd.ViewControllerRequiredFilesLoader.prototype.processFiles=function(b){for(var c in b){if(b.hasOwnProperty(c)){switch(c){case"contentView":var a=this.addFilesOfType([b[c]],c);this.contentViewLoader=a[0];break;case"stylesheets":this.addFilesOfType(b[c],c);break;case"scripts":this.addFilesOfType(b[c],c);break;case"images":this.addFilesOfType(b[c],c);break;default:iAd.Console.warn('iAd.ViewController # loadRequiredFiles : unknown key "'+c+'" in configuration.requiredFileURIs');break}}}};iAd.ViewControllerRequiredFilesLoader.prototype.addFilesOfType=function(a,h){var g=iAd.ViewControllerRequiredFilesLoader.LOADER_CLASSES[h];if(!g){iAd.Console.warn('iAd.ViewController #loadRequiredFiles : No known loader for type "'+h+'"');return}var e=[];for(var d=0,f=a.length;d<f;d++){var b=a[d];var j;if(g==iAd.ImageLoader){var c=this.viewController.configuration;j=new g(b,c.hasHiDPIVersion)}else{j=new g(b)}this.add(j);e.push(j)}return e};iAd.ViewControllerRequiredFilesLoader.prototype.notifyLoaderDidProgress=function(a){this.callSuper(a);this.viewController.requiredFilesLoaderDidProgress(this,this.progress,a)};iAd.ViewControllerRequiredFilesLoader.prototype.notifyLoaderDidFail=function(a){this.callSuper(a);this.viewController.requiredFilesLoaderDidFail(this,a)};iAd.ViewControllerRequiredFilesLoader.prototype.notifyLoaderDidComplete=function(){this.callSuper();this.viewController.requiredFilesLoaderDidComplete(this)};