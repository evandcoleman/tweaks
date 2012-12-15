#import <AssetsLibrary/AssetsLibrary.h>

%hook PLPhotoStreamsHelper

- (BOOL)shouldPublishScreenShots {
	return NO;
}

%end

%hook SBScreenShotter

- (void)finishedWritingScreenshot:(id)arg1 didFinishSavingWithError:(id)arg2 context:(void *)arg3 {
	%orig;
	
	ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
	[assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
			NSInteger numberOfAssets = [group numberOfAssets];
			if (numberOfAssets > 0) {
				NSInteger lastIndex = numberOfAssets - 1;
				[group enumerateAssetsAtIndexes:[NSIndexSet indexSetWithIndex:lastIndex] options:0 usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
					
					NSLog(@"%@",result.defaultRepresentation.url);
					
					*stop = YES;
				}];
			}
		} failureBlock:^(NSError *error) {
			NSLog(@"error: %@", error);
	}];
	[assetsLibrary release];
}

%end