//
//  test.m
//  searchbar
//
//  Created by BSA Univ3 on 20/03/14.
//  Copyright (c) 2014 BSA Univ3. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface test : XCTestCase

@end

@implementation test

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

- (void)testTrue
{
    XCTAssert(false,@"true shoulb be true");
}

@end
