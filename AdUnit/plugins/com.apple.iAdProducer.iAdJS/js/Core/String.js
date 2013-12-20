
/**
*
* Copyright © 2009-2011 Apple Inc.  All rights reserved.
*
**/

iAd.String={};iAd.String.dashedStringToCamelCase=function(a){var b=a.split("-");return b.shift()+b.map(iAd.String.capitalizeString).join("")};iAd.String.capitalizeString=function(a){return a.charAt(0).toUpperCase()+a.substr(1)};iAd.String.camelCaseStringToDashed=function(a){return a.replace(/([A-Z])/g,function(b){return"-"+b.toLowerCase()})};iAd.Utils.setupDisplayNames(iAd.String,"iAd.String");