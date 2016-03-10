//
//  TCAnalysic.m
//  TCAccount
//
//  Created by TailCat on 16/1/20.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import "TCAnalysic.h"
#import "AppAnalysicModel.h"
#import "NSDate+Format.h"
#import "AppAnalysicDBManager.h"
#import <UIKit/UIKit.h>
#import "PageAnalysicDBManager.h"
#import "PageAnalysicModel.h"


@implementation TCAnalysic

+(void)setup{

	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(appLaunch)
												 name:UIApplicationDidBecomeActiveNotification
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(appLeave)
												 name:UIApplicationWillResignActiveNotification
											   object:nil];
	
}

+(void)appLaunch{
	
	AppAnalysicModel *model = [[AppAnalysicModel alloc] init];
	
	model.enterAppTime = [NSDate stringWithDate:[NSDate date]];
	
	[self saveData:model];
	
}

+(void)appLeave{
	
	AppAnalysicModel *model = [[AppAnalysicModel alloc] init];
	
	model.leaveAppTime = [NSDate stringWithDate:[NSDate date]];
	
	[self saveData:model];
}

/** 保存数据到数据库中  */
+(void)saveData:(AppAnalysicModel *)model{
	[AppAnalysicDBManager insertAppAnalysicModel:model];
}


+(void)insertAnalysicWithName:(NSString *)viewControllerName withActionName:(NSString *)name{
	PageAnalysicModel *model = [[PageAnalysicModel alloc] init];
	model.viewControllerName = viewControllerName;
	
	[PageAnalysicDBManager insertPageAnalysicModel:model];
	
	NSMutableArray *actions = [NSMutableArray array];
	actions= [PageAnalysicDBManager actionsArrWithString:model.viewControllerName].mutableCopy;
	
	[actions addObject:[NSString stringWithFormat:@"%@",name]];
	
	[PageAnalysicDBManager insertActionsArr:actions.copy withString:model.viewControllerName];
	
}

+(void)logData{
	NSArray *appList = [AppAnalysicDBManager list];
	NSArray *pageList = [PageAnalysicDBManager list];
	
	NSLog(@"===========");
	NSLog(@"应用登陆信息：%@",appList);
	NSLog(@"===========");
	NSLog(@"===========");
	NSLog(@"页面信息：%@",pageList);
	NSLog(@"===========");
	
	
	
}

@end
