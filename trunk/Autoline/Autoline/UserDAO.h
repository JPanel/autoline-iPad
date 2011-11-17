//
//  UserDAO.h
//  Autoline
//
//  Created by 澎 贾 on 11-11-15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDAO.h"
#import "User.h"

@interface UserDAO : BaseDAO

-(void)insert:(NSString *)userId :(NSString *)password :(NSString *)dealerCode :(NSNumber *)autoLogin;
-(User *)getAutoLoginUser;
-(User *)getUserByUserId:(NSString *)userId;

@end
