//
//  UIViewController+Utils.h
//  CommonComponents
//
//  Created by Jason Chang on 9/18/14.
//  Copyright (c) 2014 JC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utils)
- (void) addChildViewController:(UIViewController *)childController setupBlock:(void (^)())block;
@end
