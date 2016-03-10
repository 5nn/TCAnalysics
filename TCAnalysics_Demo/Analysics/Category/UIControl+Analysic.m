//
//  UIControl+Analysic.m
//  TCAnalysics_Demo
//
//  Created by TailCat on 16/1/22.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import "UIControl+Analysic.h"
#import <objc/runtime.h>
#import "PageAnalysicDBManager.h"
#import "PathHelper.h"

@implementation UIControl (Analysic)

+(void)load{
	Class class = [self class];
	SEL originalSelector = @selector(sendAction:to:forEvent:);
	SEL replacementSelector = @selector(TC_sendAction:to:forEvent:);
	
	Method originalMethod = class_getInstanceMethod(class, originalSelector);
	Method replacementMethod = class_getInstanceMethod(class, replacementSelector);
	
	method_exchangeImplementations(originalMethod, replacementMethod);
}


/** 切面统计  */
-(BOOL)TC_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
	NSString *selectorName = NSStringFromSelector(action);
	
	NSLog(@"===========");
	NSLog(@"点击事件：Class:%@ Method:%@",target,selectorName);
	NSLog(@"===========");
	
	
	//从数据库中取出Actions数组，添加新的action，再存入数据库
	NSMutableArray *actions = [NSMutableArray array];
	actions= [PageAnalysicDBManager actionsArrWithString:target].mutableCopy;
	
	[actions addObject:[NSString stringWithFormat:@"%@",selectorName]];
	
	[PageAnalysicDBManager insertActionsArr:actions.copy withString:target];
	
	return [self TC_sendAction:action to:target forEvent:event];
}

@end

