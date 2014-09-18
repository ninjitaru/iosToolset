#import "Store.h"
#import "AppDelegate+Private.h"

// This store is also often called a service layer or a repository.
// use store object to remove service/object retrival local off viewcontroller
@implementation Store

// shared instace created through dispatch_once_t
+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
                      sharedInstance = [self new];
                  });
    return sharedInstance;
}

// instace from AppDelegate
// doing so for depency sake??
+ (instancetype) sharedAppDelegateInstance {
    return ((AppDelegate *)[UIApplication sharedApplication].delegate).store;
}

@end