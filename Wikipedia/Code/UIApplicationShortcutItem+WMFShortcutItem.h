@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UIApplicationShortcutItem (WMFShortcutItem)

@property (class, nonatomic, assign, readonly, nonnull) NSString *wmfTypeSearch;
@property (class, nonatomic, assign, readonly, nonnull) NSString *wmfTypeContinueReading;
@property (class, nonatomic, assign, readonly, nonnull) NSString *wmfTypeRandom;
@property (class, nonatomic, assign, readonly, nonnull) NSString *wmfTypeNearby;

+ (UIApplicationShortcutItem *)wmf_search;
+ (UIApplicationShortcutItem *)wmf_random;
+ (UIApplicationShortcutItem *)wmf_nearby;

@end

NS_ASSUME_NONNULL_END
