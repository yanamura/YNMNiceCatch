//
//  YNMNiceCatch.m
//  YNMNiceCatch
//
//  Created by yanamura on 2014/10/05.
//  Copyright (c) 2014年 Yasuharu Yanamura. All rights reserved.
//

#import "YNMNiceCatch.h"

NSString* const YNM_EXCEPTION_NOTIFICATION = @"exception_notification";

@implementation YNMNiceCatch

+ (nullable id)exceptionNotification:(__nullable id (^ __nonnull)(void))block
{
    @try {
        return block();
    }
    @catch (NSException *exception) {
        [[NSNotificationCenter defaultCenter] postNotificationName:YNM_EXCEPTION_NOTIFICATION object:nil];
    }
    return nil;
}

+ (nullable id)niceCatch:(__nullable id (^ __nonnull)(void))block
{
    @try {
        return block();
    }
    @catch (NSException *exception) {
        // nice catch!
        NSLog(@"%@",exception);
    }
    return nil;
}

@end