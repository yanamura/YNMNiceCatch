//
//  YNMNiceCatchTests.m
//  YNMNiceCatchTests
//
//  Created by yanamura on 2014/10/05.
//  Copyright (c) 2014年 Yasuharu Yanamura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "YNMNiceCatch.h"

@interface YNMNiceCatchTests : XCTestCase
@property (nonatomic, assign) BOOL isExceptionRaised;
@end

@implementation YNMNiceCatchTests

- (void)testExceptionNotification
{
    self.isExceptionRaised = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(exceptionRaised)
                                                 name:YNM_EXCEPTION_NOTIFICATION
                                               object:nil];

    [YNMNiceCatch exceptionNotification:^id{
        [NSException raise:@"ex1" format:nil];
        return nil;
    }];

    XCTAssertTrue(self.isExceptionRaised);
}

- (void)testNotExceptionNotification
{
    self.isExceptionRaised = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(exceptionRaised)
                                                 name:YNM_EXCEPTION_NOTIFICATION
                                               object:nil];

    id result = [YNMNiceCatch exceptionNotification:^id{
        return @"test";
    }];

    XCTAssertEqual(@"test", result);
    XCTAssertFalse(self.isExceptionRaised);
}

- (void)testNiceCatch {
    XCTAssertNoThrow(
                     [YNMNiceCatch niceCatch:^id
                      {
                          [NSException raise:@"ex1" format:nil];
                          return nil;
                      }]
                     );
}

- (void)testNoNeedToNiceCatch {
    id result = [YNMNiceCatch niceCatch:^id{
        return @"test";
    }];

    XCTAssertEqual(@"test", result);
}

//MARK: Helper Methods
- (void)exceptionRaised
{
    self.isExceptionRaised = YES;
}

@end
