//
//  AppAnalysicDBManager.h
//  TCAccount
//
//  Created by TailCat on 16/1/20.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppAnalysicModel;

@interface AppAnalysicDBManager : NSObject

+(BOOL)insertAppAnalysicModel:(AppAnalysicModel *)model;

+(NSArray *)list;

+(BOOL)dropDB;

@end
