//
//  PathHelper.m
//  TCAccount
//
//  Created by TailCat on 16/1/14.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import "PathHelper.h"

@implementation PathHelper

+(NSString *)cachePath{
	return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}

+(NSString *)homeDirectory{
	return NSHomeDirectory();
}

+(NSString *)documentsPath{
	return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

+(NSString *)libraryPath{
	return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
}

+(NSString *)tmpPath{
	return NSTemporaryDirectory();
}

@end
