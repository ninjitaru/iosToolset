//
//  UIViewController+Utils.m
//  CommonComponents
//
//  Created by Jason Chang on 9/18/14.
//  Copyright (c) 2014 JC. All rights reserved.
//

#import "UIViewController+Utils.h"

@implementation UIViewController (Utils)
- (void) addChildViewController:(UIViewController *)childController setupBlock:(void (^)())block {
    [self addChildViewController: childController];
    if(block) {
        block();
    }
    [childController didMoveToParentViewController: self];
}
@end
