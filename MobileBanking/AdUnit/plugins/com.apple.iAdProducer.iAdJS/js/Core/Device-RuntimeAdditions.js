
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.Device.iOS_42_VERSION_CLASS="ios_4_2";iAd.Device.iOSVersionIs4_2=function(){return !iAd.Device.iOSVersionLessThan("4.2")&&iAd.Device.iOSVersionLessThan("4.3")};iAd.Device.register4_2VersionClass=function(){if(iAd.Device.iOS_VERSION!=null){if(iAd.Device.iOSVersionIs4_2()){document.body.addClassName(iAd.Device.iOS_42_VERSION_CLASS)}}};window.addEventListener("DOMContentLoaded",iAd.Device.register4_2VersionClass,false);