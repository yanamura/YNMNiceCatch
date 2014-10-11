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

+ (id)exceptionNotification:(id (^)(void))block
{
    @try {
        if (block) {
            return block();
        }
    }
    @catch (NSException *exception) {
        [[NSNotificationCenter defaultCenter] postNotificationName:YNM_EXCEPTION_NOTIFICATION object:nil];
    }
    return nil;
}

+ (id)niceCatch:(id (^)(void))block
{
    @try {
        if (block) {
            return block();
        }
    }
    @catch (NSException *exception) {
        // nice catch!
    }
    return nil;
}

@end