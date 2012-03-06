#import <SpringBoard/SBApplicationIcon.h>

%hook SBIconController

- (BOOL)iconAllowsBadging:(id)arg1 {
	if([[arg1 applicationBundleID] isEqualToString:@"com.apple.Preferences"]) {
		return NO;
	}
	return %orig;
}

%end