//
//  ArrayDataSourceTest.m
//  CommonComponents
//
//  Created by Jason Chang on 9/18/14.
//  Copyright (c) 2014 JC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ArrayDataSource.h"

@interface ArrayDataSourceTest : XCTestCase

@end

@implementation ArrayDataSourceTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
//    - (void)testInitializing
//    {
//        STAssertNil([[ArrayDataSource alloc] init], @"Should not be allowed.");
//        
//        id obj1 = [[ArrayDataSource alloc] initWithItems:@[] cellIdentifier:@"foo" configureCellBlock:^(UITableViewCell *a, id b){}];
//        STAssertNotNil(obj1, @"");
//    }
//    
//    - (void)testCellConfiguration
//    {
//        __block UITableViewCell *configuredCell = nil;
//        __block id configuredObject = nil;
//        TableViewCellConfigureBlock block = ^(UITableViewCell *a, id b){
//            configuredCell = a;
//            configuredObject = b;
//        };
//        ArrayDataSource *dataSource = [[ArrayDataSource alloc] initWithItems:@[@"a", @"b"] cellIdentifier:@"foo" configureCellBlock:block];
//        
//        id mockTableView = [self autoVerifiedMockForClass:[UITableView class]];
//        
//        UITableViewCell *cell = [[UITableViewCell alloc] init];
//        [[[mockTableView expect] andReturn:cell] dequeueReusableCellWithIdentifier:@"foo" forIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//        
//        id result = [dataSource tableView:mockTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//        STAssertEquals(result, cell, @"Should return the dummy cell.");
//        STAssertEquals(configuredCell, cell, @"This should have been passed to the block.");
//        STAssertEqualObjects(configuredObject, @"a", @"This should have been passed to the block.");
//    }
//    
//    - (void)testNumberOfRows
//    {
//        id mockTableView = [self autoVerifiedMockForClass:[UITableView class]];
//        ArrayDataSource *dataSource = [[ArrayDataSource alloc] initWithItems:@[@"a", @"b"] cellIdentifier:@"foo" configureCellBlock:nil];
//        STAssertEquals([dataSource tableView:mockTableView numberOfRowsInSection:0], (NSInteger) 2, @"");
//    }
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
