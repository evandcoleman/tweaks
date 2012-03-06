#import <SpringBoard/SBIcon.h>
#import <SpringBoard/SBIconView.h>

%hook SBIcon

- (id)reflectedIcon:(BOOL)arg1 {
	return nil;
}

%end

%hook SBIconView

- (BOOL)showsReflection {
	return NO;
}

%end