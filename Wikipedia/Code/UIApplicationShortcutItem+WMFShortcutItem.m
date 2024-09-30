#import "UIApplicationShortcutItem+WMFShortcutItem.h"
#import "Config.h"
@import WMF.Swift;
@import WMF.WMFLocalization;
@import WMF.NSURL_WMFLinkParsing;

NS_ASSUME_NONNULL_BEGIN

@implementation UIApplicationShortcutItem (WMFShortcutItem)

+ (NSString *) wmfTypeSearch {
    return [NSString stringWithFormat:@"%@.icon-shortcut-search", Config.mainId];
}

+ (NSString *) wmfTypeContinueReading {
    return [NSString stringWithFormat:@"%@.icon-shortcut-continue-reading", Config.mainId];
}

+ (NSString *) wmfTypeRandom {
    return [NSString stringWithFormat:@"%@.icon-shortcut-random", Config.mainId];
}

+ (NSString *) wmfTypeNearby {
    return [NSString stringWithFormat:@"%@.icon-shortcut-nearby", Config.mainId];
}


+ (UIApplicationShortcutItem *)wmf_search {
    return [[UIApplicationShortcutItem alloc] initWithType:self.wmfTypeSearch
                                            localizedTitle:WMFLocalizedStringWithDefaultValue(@"icon-shortcut-search-title", nil, nil, @"Search Wiki Unblocked", @"Title for app icon force touch shortcut to quickly open the search interface.")
                                         localizedSubtitle:@""
                                                      icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"search"]
                                                  userInfo:nil];
}

+ (UIApplicationShortcutItem *)wmf_random {
    return [[UIApplicationShortcutItem alloc] initWithType:self.wmfTypeRandom
                                            localizedTitle:WMFLocalizedStringWithDefaultValue(@"icon-shortcut-random-title", nil, nil, @"Random article", @"Title for app icon force touch shortcut to quickly open a random article. {{Identical|Random article}}")
                                         localizedSubtitle:@""
                                                      icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"random-quick-action"]
                                                  userInfo:nil];
}

+ (UIApplicationShortcutItem *)wmf_nearby {
    return [[UIApplicationShortcutItem alloc] initWithType:self.wmfTypeNearby
                                            localizedTitle:WMFLocalizedStringWithDefaultValue(@"icon-shortcut-nearby-title", nil, nil, @"Nearby articles", @"Title for app icon force touch shortcut to quickly open the nearby articles interface.")
                                         localizedSubtitle:@""
                                                      icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"nearby-quick-action"]
                                                  userInfo:nil];
}

@end

NS_ASSUME_NONNULL_END
