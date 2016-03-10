//
//  AppAnalysicModel.h
//  TCAccount
//
//  Created by TailCat on 16/1/20.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppAnalysicModel : NSObject

///** 用户ID  */
//@property (strong,nonatomic) NSString *userId;

/** 进入APP时间戳  */
@property (strong,nonatomic) NSString *enterAppTime;
/** 退出APP时间戳  */
@property (strong,nonatomic) NSString *leaveAppTime;

///** 今日启动次数  */
//@property (assign,nonatomic) NSInteger appLaunchTimes;

@end
