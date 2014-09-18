//
//  ExampleTableViewController.m
//  CommonComponents
//
//  Created by Jason Chang on 9/18/14.
//  Copyright (c) 2014 JC. All rights reserved.
//

#import "ExampleTableViewController.h"
#import "ArrayDataSource.h"

@interface ExampleTableViewController ()
@property (nonatomic,strong) ArrayDataSource *dataSource;
@end

static NSString *const cellIdentifier = @"cell";

@implementation ExampleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: cellIdentifier];
    self.dataSource = [[ArrayDataSource alloc] initWithItems: @[@"1",@"2",@"3",@"4"] cellIdentifier: cellIdentifier configureCellBlock:^(UITableViewCell *cell, NSString *item) {
        cell.textLabel.text = item;
    }];
    self.tableView.dataSource = self.dataSource;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndex = indexPath;
    [self.delegate didSelectItem: [self.dataSource itemAtIndexPath: indexPath]];
    // calling deselect row will not sent willSelect / didDeselect
//    [tableView deselectRowAtIndexPath: indexPath animated: YES];
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.selectedIndex == indexPath) {
        self.selectedIndex = nil;
    }
}

@end
