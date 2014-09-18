//
//  ExampleVViewController.m
//  CommonComponents
//
//  Created by Jason Chang on 9/18/14.
//  Copyright (c) 2014 JC. All rights reserved.
//

#import "ExampleViewController.h"
#import "ExampleTableViewController.h"
#import "UIViewController+Utils.h"

#define Delegation 0
#define UseContext 1

@interface ExampleViewController () <ExampleTableViewDelegate>
@property (nonatomic,weak) UILabel *label;
@property (nonatomic,weak) ExampleTableViewController *tableViewController;
@end

static void *ExampleTableViewControllerSelectedIndex = &ExampleTableViewControllerSelectedIndex;

@implementation ExampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ExampleTableViewController *tableViewController = [ExampleTableViewController new];
#if Delegation != 0
    tableViewController.delegate = self;
#endif
    self.tableViewController = tableViewController;
    UIView *view = self.view;
    __weak typeof(self) weakSelf = self;
    [self addChildViewController: tableViewController setupBlock: ^{
        [view addSubview: tableViewController.view];
#if Delegation == 0
        [tableViewController addObserver: weakSelf forKeyPath: NSStringFromSelector(@selector(selectedIndex)) options: (NSKeyValueObservingOptionNew) context: ExampleTableViewControllerSelectedIndex];
#endif
    }];
    self.tableViewController.selectedIndex = [NSIndexPath indexPathForItem: 0 inSection: 0];
    UILabel *label = [UILabel new];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview: label];
    self.label = label;
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void) dealloc {
    // view are never killed after ios 6 even under low memory
    // so cleanup goes into dealloc
    @try {
        [self.tableViewController removeObserver:self forKeyPath:NSStringFromSelector(@selector(selectedIndex))];
    }
    @catch (NSException * __unused exception) {}
}

- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = 30;
    self.label.frame = (CGRect){0,self.topLayoutGuide.length,width,height};
    self.tableViewController.view.frame = (CGRect){0,self.topLayoutGuide.length+height,width,CGRectGetHeight(self.view.bounds)-height};
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // implement through context
#if UseContext == 1
    if(context == ExampleTableViewControllerSelectedIndex) {
        if(object == self.tableViewController) {
            [self updateLabelWithIndexPath: change[NSKeyValueChangeNewKey] color: [UIColor redColor]];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
#endif
#if UseContext == 0
    // implement through type checking
    if([object isKindOfClass: [ExampleTableViewController class]]) {
        if([keyPath isEqualToString: NSStringFromSelector(@selector(selectedIndex))]) {
            [self updateLabelWithIndexPath: change[NSKeyValueChangeNewKey] color: [UIColor blueColor]];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
#endif
}

- (void) updateLabelWithIndexPath:(NSIndexPath *)indexPath color:(UIColor *)color {
    self.label.text = nil;
    if(indexPath) {
        self.label.text = [@(indexPath.row+1) stringValue];
        self.label.textColor = color;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - communicate through delegate

- (void) didSelectItem:(NSString *)item {
    self.label.textColor = [UIColor blackColor];
    self.label.text = item;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
