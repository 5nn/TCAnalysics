//
//  PathHelper.h
//  TCAccount
//
//  Created by TailCat on 16/1/14.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PathHelper : NSObject


/**
 *  返回沙盒根目录
 */
+(NSString *)homeDirectory;

/**
 *  返回Documents路径
 */
+(NSString *)documentsPath;


/**
 *  返回Library路径
 */
+(NSString *)libraryPath;


/**
 *  返回Tmp路径
 */
+(NSString *)tmpPath;

/**
 *  返回cache路径
 */
+(NSString *)cachePath;

@end
