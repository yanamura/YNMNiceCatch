//
//  YNMNiceCatch.h
//  YNMNiceCatch
//
//  Created by yanamura on 2014/10/05.
//  Copyright (c) 2014年 Yasuharu Yanamura. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for YNMNiceCatch.
FOUNDATION_EXPORT double YNMNiceCatchVersionNumber;

//! Project version string for YNMNiceCatch.
FOUNDATION_EXPORT const unsigned char YNMNiceCatchVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <YNMNiceCatch/PublicHeader.h>

extern NSString* const YNM_EXCEPTION_NOTIFICATION;

@import Foundation;

@interface YNMNiceCatch : NSObject

+ (id)exceptionNotification:(id (^)(void))block;
+ (id)niceCatch:(id (^)(void))block;

@end
