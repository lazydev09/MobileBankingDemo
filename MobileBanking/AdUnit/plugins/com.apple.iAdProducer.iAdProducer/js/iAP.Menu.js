
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.Class({name:"iAP.Menu",superclass:iAd.View,cssClassName:"iap-menu",synthesizedProperties:["destinations","buttonTemplate","buttonHeight","buttonPadding"],archivedProperties:["destinations","buttonTemplate","buttonHeight","buttonPadding"],collectionAccessor:"menus"});iAP.Menu.prototype.init=function(a){this.buttonDestinations=[];this._destinations=[];this._buttons=[];this._buttonHeight=0;this._buttonPadding=0;this._buttonTemplate=null;this.callSuper(a);this.syncButtonsWithDestinations();this.syncButtonStyles()};iAP.Menu.prototype.setupLayer=function(){this.callSuper();var j=this.layer.querySelectorAll(".ad-button");var c,f,b=[];for(c=0,f=j.length;c<f;c++){b.push(j[c])}var h,g,a,e;var d={};for(c=b.length-1;c>=0;c--){a=b[c];e=a._view;h=e.getLayerCustomAttributeValue("ad-transitions-to");g=e.getLayerCustomAttributeValue("ad-transitions-to-id");if(h&&g){if(!d[g]){d[g]=true}else{b.splice(c,1);e.removeFromSuperview();if(window.editorProxy){editorProxy.didRemoveChildForComponentAtIndexPath(this.layer.id,[c])}}}}for(c=0,f=b.length;c<f;c++){a=b[c];e=a._view;this._buttons.push(e);this.buttonDestinations.push({destination:a.getAttribute("ad-transitions-to"),destinationID:a.getAttribute("ad-transitions-to-id"),name:e.currentTitle})}this.layer._view=this;this.forceRedraw()};iAP.Menu.prototype.setButtonHeight=function(a){if(this._buttonHeight==a){return}this._buttonHeight=a;this.syncButtonStyles()};iAP.Menu.prototype.setButtonPadding=function(a){if(this._buttonPadding==a){return}this._buttonPadding=a;this.syncButtonStyles()};iAP.Menu.prototype.syncButtonStyles=function(){if(this.declarativeLayerWasInitialized==false){return}var e=this._buttons,a=e.length,g=parseInt(this._buttonHeight,10),d=parseInt(this._buttonPadding,10);var c,f,h=0;for(var b=0;b<a;b++){c=e[b];if(b>0){h+=d}if(window.editorProxy){editorProxy.setValuesForKeysOnComponent({height:g,top:h},c.layer.id)}else{c.setLayerStyle({height:g+"px",top:h+"px"})}h+=g}if(window.editorProxy){editorProxy.setValuesForKeysOnComponent({height:h+"px"},this.layer.id)}else{this.setLayerStyle({height:h+"px"})}};iAP.Menu.prototype.setValueForAttribute=function(d,b){if(b==="ad-destinations"){var c;try{c=JSON.parse(d)}catch(a){return}this.destinations=c}else{this.callSuper(d,b)}};iAP.Menu.prototype.syncButtonsWithDestinations=function(){var o=this._buttonHeight,r=this._buttonPadding,p=this._buttons.slice(0);var w,l,c={};for(w=0,l=this._destinations.length;w<l;w++){c[this._destinations[w].destinationID]=true}var t,k={};for(w=this.buttonDestinations.length-1;w>=0;w--){t=this.buttonDestinations[w].destinationID;if(!c[t]){var x=window.editorProxy?editorProxy.shouldRemoveChildForComponentAtIndexPath(this.layer.id,[w]):true;if(x){if(window.editorProxy){var g=p[w].layer.cloneNode(true),h=getComputedStyle(p[w].layer);for(var v=h.length-1;v>-1;v--){g.style[h[v]]=h[h[v]]}g.id="placeholder-"+g.id;this.layer.insertBefore(g,p[w].layer);editorProxy.didRemoveChildForComponentAtIndexPath(this.layer.id,[w])}else{p[w].removeFromSuperview()}p.splice(w,1)}}else{k[t]=p[w]}}for(w=0,l=this._destinations.length;w<l;w++){var y=this._destinations[w],a=k[y.destinationID];if(a){var f=p.indexOf(a);var b=false,d={};if(f!=w){p.splice(f,1);p.splice(w,0,a);if(window.editorProxy){editorProxy.didMoveChildForComponentToIndex(a.layer.id,this.layer.id,w)}}if(a.getLayerCustomAttributeValue("ad-transitions-to-id")!=y.destinationID){a.layer.setAttribute("ad-transitions-to-id",y.destinationID);d["ad-transitions-to-id"]=y.destinationID;a.layer.setAttribute("ad-transitions-to",y.destination);d["ad-transitions-to"]=y.destination;b=true}if(!a.isEdited&&a.getLayerCustomAttributeValue("ad-title")!=y.name){a.tracksIsEdited=false;a.layer.setAttribute("ad-title",y.name);a.tracksIsEdited=true;d["ad-title"]=y.name;b=true}var e=this._buttons.indexOf(a),n=e*(o+r);if(e!=w&&parseFloat(document.defaultView.getComputedStyle(a.layer).top)===n){d.top=w*(o+r);b=true}if(window.editorProxy&&b){editorProxy.setValuesForKeysOnComponent(d,a.layer.id)}delete k[y.destinationID]}else{var m=window.editorProxy?editorProxy.shouldInsertChildForComponentAtIndexPath(this.layer.id,[w]):true;if(m){var q;q=new iAd.Button();q.setTitleForState(y.name,iAd.Control.STATE_NORMAL);q.layer.setAttribute("ad-transitions-to",y.destination);q.layer.setAttribute("ad-transitions-to-id",y.destinationID);q.layer.style.visibility="hidden";this.insertSubviewAtIndex(q,w);p.splice(w,0,q);var s={left:0,top:w*(o+r),width:"100%",height:o};if(window.editorProxy){var u;if(this.buttonTemplate){u=editorProxy.didInsertChildForComponentAtIndexPathWithTemplate(this.id,[w],this.buttonTemplate)}else{u=editorProxy.didInsertChildForComponentAtIndexPathWithClass(this.id,[w],"iAd.Button")}q.layer.id=u;editorProxy.setValuesForKeysOnComponent({left:s.left,top:s.top,width:s.width,height:s.height,visibility:"visible","ad-title":y.name,"ad-transitions-to":y.destination,"ad-transitions-to-id":y.destinationID,"ad-edited":"false","ad-navigates-to":y.destination},u)}}}}this._buttons=p};