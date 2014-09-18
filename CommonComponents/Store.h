#import <Foundation/Foundation.h>

@interface Store : NSObject

+ (instancetype) sharedInstance;
+ (instancetype) sharedAppDelegateInstance;

@end
