//
//  PageAnalysicDBManager.m
//  TCAccount
//
//  Created by TailCat on 16/1/20.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import "PageAnalysicDBManager.h"
#import "FMDB.h"
#import "PageAnalysicModel.h"
#import "PathHelper.h"

static FMDatabase *_db;

@implementation PageAnalysicDBManager

+(void)initialize{
	
	NSString *path = [[PathHelper cachePath] stringByAppendingString:@"/PageAnalysic.db"];
	_db = [FMDatabase databaseWithPath:path];
	
	[_db open];
	
	[_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_pageAnalysic (id integer PRIMARY KEY,viewControllerName text,enterTime TEXT,leaveTime TEXT,actionsArr blob)"];
}


+(BOOL)insertPageAnalysicModel:(PageAnalysicModel *)model{
	
	return [_db executeUpdateWithFormat:@"INSERT INTO t_pageAnalysic (viewControllerName,enterTime,leaveTime) VALUES (%@,%@,%@)",model.viewControllerName,model.enterTime,model.leaveTime];
}

+(BOOL)insertActionsArr:(NSArray *)arr withString:(NSString *)description{
	
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:arr];
	
	return [_db executeUpdateWithFormat:@"UPDATE t_pageAnalysic SET actionsArr = %@ WHERE viewControllerName = %@",data,description];
}


+(NSArray *)list{
	FMResultSet *set = [_db executeQuery:@"SELECT * FROM t_pageAnalysic"];
	
	NSMutableArray *list = [NSMutableArray array];
	
	while (set.next) {
		
		NSString *viewControllerName = [set stringForColumn:@"viewControllerName"];
		NSString *enterTime = [set stringForColumn:@"enterTime"];
		NSString *leaveTime = [set stringForColumn:@"leaveTime"];
		
		PageAnalysicModel *model =[[PageAnalysicModel alloc] init];
		model.viewControllerName = viewControllerName;
		model.enterTime = enterTime;
		model.leaveTime = leaveTime;
		
		NSData *dictData = [set objectForColumnName:@"actionsArr"];
		if (![dictData isKindOfClass:[NSNull class]]) {
			NSArray *actionsArr = [NSKeyedUnarchiver unarchiveObjectWithData:dictData];
			model.actionsArr = [actionsArr mutableCopy];
		}
		
		[list addObject: model];
		
	}
	
	return list;
}

+(NSArray *)actionsArrWithString:(NSString *)string{
	FMResultSet *set = [_db executeQuery:@"SELECT actionsArr FROM t_pageAnalysic WHERE viewControllerName = ?",string];
	
	while (set.next) {
		
		NSData *data = [set objectForColumnName:@"actionsArr"];
		
		if ([data isKindOfClass:[NSNull class]]) {
			return [NSArray array];
		}else{
			NSArray *actions = [NSKeyedUnarchiver unarchiveObjectWithData:data];
			
			if (actions.count == 0) {
				return [NSArray array];
			}else{
				return actions;
			}
		}
		
	}
	return [NSArray array];

}

+(BOOL)dropDB{
	return [_db executeUpdate:@"DROP TABLE t_pageAnalysic"];
}




@end
