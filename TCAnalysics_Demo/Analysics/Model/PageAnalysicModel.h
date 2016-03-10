//
//  PageAnalysicModel.h
//  TCAccount
//
//  Created by TailCat on 16/1/20.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageAnalysicModel : NSObject

///** 用户ID  */
//@property (strong,nonatomic) NSString *userId;

/** 进入页面VC名称  */
@property (strong,nonatomic) NSString *viewControllerName;
/** 进入时间戳  */
@property (strong,nonatomic) NSString *enterTime;
/** 离开时间戳  */
@property (strong,nonatomic) NSString *leaveTime;
/** 页面停留时间  */
@property (assign,nonatomic) NSTimeInterval stayTimeInterval;
/** 触发点击事件列表  */
@property (copy,nonatomic) NSMutableArray *actionsArr;


@end
