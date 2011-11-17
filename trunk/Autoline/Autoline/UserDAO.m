//
//  UserDAO.m
//  Autoline
//
//  Created by 澎 贾 on 11-11-15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "UserDAO.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "User.h"

@implementation UserDAO

-(void)insert:(NSString *)userId :(NSString *)password :(NSString *)dealerCode :(NSNumber *)autoLogin{
    if (![super initDatabase]){
        NSLog(@"Failed to init Database.");
    }
    [[super db] executeUpdate:[self setTable:@"INSERT INTO %@ VALUES(?,?,?,?)"],userId,password,dealerCode,autoLogin];
    if ([[super db] hadError]) {
        NSLog(@"Err %d: %@", [[super db] lastErrorCode], [[super db] lastErrorMessage]);
        [super closeDatabase];
    }
    [super closeDatabase];
}

-(User *)getAutoLoginUser{
    if (![super initDatabase]){
        NSLog(@"Failed to init Database.");
    }
    FMResultSet *rs = [[super db] executeQuery:[self setTable:@"SELECT * FROM %@ WHERE auto_login = 0"]];
    if ([[super db] hadError]) {
        NSLog(@"Err %d: %@", [[super db] lastErrorCode], [[super db] lastErrorMessage]);
        [super closeDatabase];
    }
    [super closeDatabase];
    if([rs columnCount]>0){
        User *user = [User alloc];
        while([rs next]){            
            user.userId = [rs stringForColumn:@"id"];
            user.password = [rs stringForColumn:@"password"];
            user.dealerCode = [rs stringForColumn:@"dealer_code"];
            user.autoLogin = [NSNumber numberWithInt:[rs intForColumn:@"auto_login"]];            
        }
        [rs close];
        return user;
    }
    [rs close];
    return NULL;
}

-(User *)getUserByUserId:(NSString *)userId{
    if (![super initDatabase]){
        NSLog(@"Failed to init Database.");
    }
    FMResultSet *rs = [[super db] executeQuery:[self setTable:@"SELECT * FROM %@ WHERE id = ?"],userId];
    if ([[super db] hadError]) {
        NSLog(@"Err %d: %@", [[super db] lastErrorCode], [[super db] lastErrorMessage]);
        [super closeDatabase];
    }
    [super closeDatabase];
    if([rs columnCount]>0){
        User *user = [User alloc];
        while([rs next]){            
            user.userId = [rs stringForColumn:@"id"];
            user.password = [rs stringForColumn:@"password"];
            user.dealerCode = [rs stringForColumn:@"dealer_code"];
            user.autoLogin = [NSNumber numberWithInt:[rs intForColumn:@"auto_login"]];            
        }
        [rs close];
        return user;
    }
    [rs close];
    return NULL;
}

-(NSString *)setTable:(NSString *)sql{
    return [NSString stringWithFormat:sql,  @"autoline_user"];
}


@end
