/**
 * NCPad - full size notification banners for iPad
 *
 * By Ad@m <http://adam.hbang.ws>
 * Licensed under the MIT License <http://adam.mit-license.org>
 */

#import <UIKit/UIDevice2.h>
#import <CoreGraphics/CoreGraphics.h>

#define ADNPWidthForOrient(orient) (UIDeviceOrientationIsLandscape(orient)||UIInterfaceOrientationIsLandscape(orient)?[[UIScreen mainScreen]bounds].size.height:[[UIScreen mainScreen]bounds].size.width)

%hook SBBulletinBannerController
-(CGRect)_normalBannerFrameForOrientation:(int)orientation{
	CGRect frame=%orig;
	frame.origin.x=0;
	frame.size.width=ADNPWidthForOrient(orientation);
	return frame;
}
-(CGRect)_currentBannerFrameForOrientation:(int)orientation{
	CGRect frame=%orig;
	frame.origin.x=0;
	frame.size.width=ADNPWidthForOrient(orientation);
	return frame;
}
%end