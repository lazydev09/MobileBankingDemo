
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.Class({name:"iAd.NavigationViewProcessor",superclass:iAd.ViewControllerReferencingViewProcessor});iAd.NavigationViewProcessor.PREVIOUS_ITEM_ID="{previous-item}";iAd.NavigationViewProcessor.ATTR_NAME="ad-navigates-to";iAd.NavigationViewProcessor.PROCESSED_KEY="_adProcessedNavigatesTo";iAd.NavigationViewProcessor.prototype.handleEvent=function(d){if(!this.shouldHandleEvent(d)){return}var c=d.currentTarget;var f=iAd.Element.getCustomAttribute(c,iAd.NavigationViewProcessor.ATTR_NAME);var e=iAd.RootViewController.sharedRootViewController.stackController;if(f==iAd.NavigationViewProcessor.PREVIOUS_ITEM_ID){e.popViewControllerAnimated(true)}else{var a=iAd.ViewController.instances[f];if(a){var b=(e.viewControllers.indexOf(a)!=-1);if(b){e.popToViewControllerAnimated(a,true)}else{e.pushViewControllerAnimated(a,true)}}}};iAd.ViewController.addViewProcessor(iAd.NavigationViewProcessor);