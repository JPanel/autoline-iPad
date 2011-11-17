//
//  BaseDAO.m
//  Autoline
//
//  Created by 澎 贾 on 11-11-15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "BaseDAO.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "AppDelegate.h"

@implementation BaseDAO

@synthesize db;

-(NSString *)setTable:(NSString *)sql{
    return NULL;
}

- (BOOL)initDatabase{
    BOOL success;
    NSError *error;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"Autoline.db"];
    
    success = [fm fileExistsAtPath:writableDBPath];
    if(!success){
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Autoline.db"];
        success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if(!success){
            NSLog([error localizedDescription]);
        }
        success = NO;
    }
    if(success){
        db = [FMDatabase databaseWithPath:writableDBPath];
        if ([db open]) {
            [db setShouldCacheStatements:YES];
        }else{
            NSLog(@"Failed to open database.");
            success = NO;
        }
    }
    return success;
}

- (void) closeDatabase{
    [db close];
}


@end
