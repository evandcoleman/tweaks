#import <UIKit/UIKit.h>
#import <MobileSafari/TabToolbarButton.h>
#import <MobileSafari/BrowserToolbar.h>
#import <MobileSafari/TabController.h>
#import <MobileSafari/BrowserController.h>

@interface BrowserToolbar (TabCleaner)

- (void)doubleTappedTabButton:(UITapGestureRecognizer *)gesture;
- (void)longPressOnTabButton:(UILongPressGestureRecognizer *)gesture;

@end

%hook BrowserToolbar

- (void)_installGestureRecognizers {
	%orig;
	TabToolbarButton *&_tabExposeView(MSHookIvar<TabToolbarButton *>(self, "_tabExposeView"));
	
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTappedTabButton:)];
	tap.numberOfTapsRequired = 2.0;
	[_tabExposeView addGestureRecognizer:tap];
	[tap release];
	
	UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressOnTabButton:)];
	press.minimumPressDuration = 2.0;
	[_tabExposeView addGestureRecognizer:press];
	[press release];
}

%new
- (void)doubleTappedTabButton:(UITapGestureRecognizer *)gesture {
	TabController *tabController = [[objc_getClass("BrowserController") sharedBrowserController] tabController];
	NSArray *arr = [[tabController tabDocuments] copy];
	for(id a in arr) {
		if(a != [tabController activeTabDocument])
			[tabController closeTabDocument:a animated:NO];
	}
	[arr release];
}

%new
- (void)longPressOnTabButton:(UILongPressGestureRecognizer *)gesture {
	TabController *tabController = [[objc_getClass("BrowserController") sharedBrowserController] tabController];
	NSArray *arr = [[tabController tabDocuments] copy];
	for(id a in arr) {
		[tabController closeTabDocument:a animated:NO];
	}
	[arr release];
}

%end
