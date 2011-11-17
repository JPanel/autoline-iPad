//
//  User.h
//  Autoline
//
//  Created by 澎 贾 on 11-11-15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *dealerCode;
@property (nonatomic, assign) NSNumber *autoLogin;

@end
