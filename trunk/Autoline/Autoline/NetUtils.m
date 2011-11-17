//
//  NetUtils.m
//  Autoline
//
//  Created by 澎 贾 on 11-11-16.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "NetUtils.h"

@implementation NetUtils

+(BOOL)checkNetStatus;{
    BOOL reachability;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            // 没有网络连接
            NSLog(@"没有网络");
            reachability = NO;
            break;
        case ReachableViaWWAN:
            // 使用3G网络
            NSLog(@"正在使用3G网络");
            reachability = YES;
            break;
        case ReachableViaWiFi:
            // 使用WiFi网络
            NSLog(@"正在使用wifi网络"); 
            reachability = YES;
            break;
    }
    return reachability;
}

@end
