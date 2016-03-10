//
//  NSDate+Format.m
//  TCAccount
//
//  Created by TailCat on 16/1/20.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import "NSDate+Format.h"

@implementation NSDate (Format)

+(NSString *)stringWithDate:(NSDate *)date{
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	NSTimeZone *timeZone = [NSTimeZone localTimeZone];
	
	[formatter setTimeZone:timeZone];
	[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	
	return [formatter stringFromDate:date];
	
}

@end
