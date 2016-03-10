//
//  PageAnalysicDBManager.h
//  TCAccount
//
//  Created by TailCat on 16/1/20.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PageAnalysicModel;

@interface PageAnalysicDBManager : NSObject

+(BOOL)insertPageAnalysicModel:(PageAnalysicModel *)model;

+(BOOL)insertActionsArr:(NSArray *)arr withString:(NSString *)description;

+(NSArray *)list;

+(NSArray *)actionsArrWithString:(NSString *)string;

+(BOOL)dropDB;

@end
