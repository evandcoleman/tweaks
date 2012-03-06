#import <SpringBoard/SpringBoard.h>

%hook SpringBoard

- (BOOL)canShowLockScreenCameraButton {
	return NO;
}

%end