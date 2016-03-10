//
//  TCAnalysic.h
//  TCAccount
//
//  Created by TailCat on 16/1/20.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppAnalysicModel;
@class PageAnalysicModel;

@interface TCAnalysic : NSObject

/** 初始化  */
+(void)setup;
/** App启动  */
+(void)appLaunch;
/** App退出  */
+(void)appLeave;

/** 手动添加记录  */
+(void)insertAnalysicWithName:(NSString *)viewControllerName withActionName:(NSString *)name;

/** 输出 */
+(void)logData;

@end
