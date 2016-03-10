//
//  AppAnalysicDBManager.m
//  TCAccount
//
//  Created by TailCat on 16/1/20.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import "AppAnalysicDBManager.h"
#import "FMDB.h"
#import "AppAnalysicModel.h"
#import "PathHelper.h"

static FMDatabase *_db;

@implementation AppAnalysicDBManager


+(void)initialize{
	
	NSString *path = [[PathHelper cachePath] stringByAppendingString:@"/AppAnalysic.db"];
	_db = [FMDatabase databaseWithPath:path];
	
	[_db open];
	
	bool flag = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_appAnalysic (id integer PRIMARY KEY,enterAppTime text,leaveAppTime TEXT)"];
	if (flag==YES) {
		NSLog(@"创建成功");
	}else{
		NSLog(@"创建失败");
	}
}

+(BOOL)insertAppAnalysicModel:(AppAnalysicModel *)model{
	
	return [_db executeUpdateWithFormat:@"INSERT INTO t_appAnalysic (enterAppTime,leaveAppTime) VALUES (%@,%@)",model.enterAppTime,model.leaveAppTime];
}


+(NSArray *)list{
	FMResultSet *set = [_db executeQuery:@"SELECT * FROM t_appAnalysic"];
	
	NSMutableArray *list = [NSMutableArray array];
	
	while (set.next) {
		
		NSString *enterTime = [set stringForColumn:@"enterAppTime"];
		NSString *leaveTime = [set stringForColumn:@"leaveAppTime"];
		
		AppAnalysicModel *model =[[AppAnalysicModel alloc] init];
		
		model.enterAppTime = enterTime;
		model.leaveAppTime = leaveTime;
		
		[list addObject: model];
		
	}
	
	return list;
}

+(BOOL)dropDB{
	return [_db executeUpdate:@"DROP TABLE t_appAnalysic"];
}

@end
