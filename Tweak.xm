#import <SpringBoard/SBBannerContextView.h>
#import <version.h>

#define WIDTH_FOR_ORIENTATION(orientation) (UIInterfaceOrientationIsLandscape(orientation) \
	? [UIScreen mainScreen].bounds.size.height \
	: [UIScreen mainScreen].bounds.size.width)

@interface SBBannerContextView (NCPad)

- (CGRect)_ncpad_modifiedContentFrameForFrame:(CGRect)frame;

@end

%group SteveJobs
%hook SBBulletinBannerController

- (CGRect)_normalBannerFrameForOrientation:(UIInterfaceOrientation)orientation {
	CGRect frame = %orig;
	frame.origin.x = 0;
	frame.size.width = WIDTH_FOR_ORIENTATION(orientation);
	return frame;
}

- (CGRect)_currentBannerFrameForOrientation:(UIInterfaceOrientation)orientation {
	CGRect frame = %orig;
	frame.origin.x = 0;
	frame.size.width = WIDTH_FOR_ORIENTATION(orientation);
	return frame;
}

%end
%end

%group ScottForstall
%hook SBBannerController

- (CGRect)_normalBannerFrameForOrientation:(UIInterfaceOrientation)orientation {
	CGRect frame = %orig;
	frame.origin.x = 0;
	frame.size.width = WIDTH_FOR_ORIENTATION(orientation);
	return frame;
}

- (CGRect)_currentBannerFrameForOrientation:(UIInterfaceOrientation)orientation {
	CGRect frame = %orig;
	frame.origin.x = 0;
	frame.size.width = WIDTH_FOR_ORIENTATION(orientation);
	return frame;
}

%end
%end

%hook SBBannerContextView

%new - (CGRect)_ncpad_modifiedContentFrameForFrame:(CGRect)frame {
	frame.origin.x = 15.f;
	frame.size.width = self.frame.size.width - 30.f;
	return frame;
}

%group JonyIve

- (CGRect)_contentFrame {
	return [self _ncpad_modifiedContentFrameForFrame:%orig];
}

%end

%group CraigFederighi

- (CGRect)_centeredBoundsForRect:(CGRect)rect {
	return [self _ncpad_modifiedContentFrameForFrame:%orig];
}

%end

%end

%ctor {
	%init;

	if (IS_IOS_OR_NEWER(iOS_8_0)) {
		%init(CraigFederighi);
	} else if (IS_IOS_OR_NEWER(iOS_7_0)) {
		%init(JonyIve);
	} else if (IS_IOS_OR_NEWER(iOS_6_0)) {
		%init(ScottForstall);
	} else {
		%init(SteveJobs);
	}
}
