#import <SpringBoard/SBBannerContextView.h>
#import <version.h>

#define WIDTH_FOR_ORIENTATION(orientation) (UIInterfaceOrientationIsLandscape(orientation) \
	? [UIScreen mainScreen].bounds.size.height \
	: [UIScreen mainScreen].bounds.size.width)

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

%group JonyIve
%hook SBBannerContextView

- (CGRect)_contentFrame {
	CGRect frame = %orig;
	frame.origin.x = 15.f;
	frame.size.width = self.frame.size.width - 30.f;
	return frame;
}

%end
%end

%ctor {
	%init;

	if (IS_IOS_OR_NEWER(iOS_7_0)) {
		%init(JonyIve);
	} else if (IS_IOS_OR_NEWER(iOS_6_0)) {
		%init(ScottForstall);
	} else {
		%init(SteveJobs);
	}
}
