#import "Config.h"

#define MACRO_STRING_(m) #m
#define MACRO_STRING(m) @MACRO_STRING_(m)

@implementation Config

+ (NSString *) mainId {
    return MACRO_STRING(MAIN_ID);
}

+ (NSString *) groupId {
    return MACRO_STRING(WMF_APP_GROUP_IDENTIFIER);
}

@end
