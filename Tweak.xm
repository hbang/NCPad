/**
 * NCPad - full size notification banners for iPad
 *
 * By Ad@m <http://adam.hbang.ws>
 * Licensed under the MIT License <http://adam.mit-license.org>
 */

#define HBNPWidthForOrient(orient) (UIDeviceOrientationIsLandscape(orient) \
	? [UIScreen mainScreen].bounds.size.height \
	: [UIScreen mainScreen].bounds.size.width)

%group HBNPiOS5
%hook SBBulletinBannerController
-(CGRect)_normalBannerFrameForOrientation:(int)orientation {
	CGRect frame = %orig;
	frame.origin.x = 0;
	frame.size.width = HBNPWidthForOrient(orientation);
	return frame;
}

-(CGRect)_currentBannerFrameForOrientation:(int)orientation {
	CGRect frame = %orig;
	frame.origin.x = 0;
	frame.size.width = HBNPWidthForOrient(orientation);
	return frame;
}
%end
%end

%group HBNPiOS6
%hook SBBannerController
-(CGRect)_normalBannerFrameForOrientation:(int)orientation {
	CGRect frame = %orig;
	frame.origin.x = 0;
	frame.size.width = HBNPWidthForOrient(orientation);
	return frame;
}

-(CGRect)_currentBannerFrameForOrientation:(int)orientation {
	CGRect frame = %orig;
	frame.origin.x = 0;
	frame.size.width = HBNPWidthForOrient(orientation);
	return frame;
}
%end
%end

%ctor {
	if (kCFCoreFoundationVersionNumber >= 793) {
		%init(HBNPiOS6);
	} else {
		%init(HBNPiOS5);
	}
}
