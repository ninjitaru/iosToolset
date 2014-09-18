//
//  ExampleTableViewController.h
//  CommonComponents
//
//  Created by Jason Chang on 9/18/14.
//  Copyright (c) 2014 JC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ExampleTableViewDelegate <NSObject>

- (void) didSelectItem:(id)item;

@end

@interface ExampleTableViewController : UITableViewController
@property (nonatomic,weak) id<ExampleTableViewDelegate> delegate;
@property (nonatomic,strong) NSIndexPath *selectedIndex;
@end
