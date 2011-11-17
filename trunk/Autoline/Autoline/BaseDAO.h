//
//  BaseDAO.h
//  Autoline
//
//  Created by 澎 贾 on 11-11-15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;

@interface BaseDAO : NSObject

@property (nonatomic,retain) FMDatabase *db;
-(NSString *)setTable:(NSString *)sql;
-(BOOL) initDatabase;
- (void) closeDatabase;

@end
