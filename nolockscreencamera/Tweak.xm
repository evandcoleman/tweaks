

%hook SpringBoard

- (BOOL)canShowLockScreenCameraButton {
	return NO;
}

- (BOOL)canShowLockScreenCameraKnob {
	return NO;
}

- (BOOL)canShowLockScreenCameraGrabber {
	return NO;
}

%end