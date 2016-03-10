//
//  UITableView+Analysic.m
//  TCAnalysics_Demo
//
//  Created by TailCat on 16/1/22.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import "UITableView+Analysic.h"
#import <objc/runtime.h>
#import <objc/message.h>


@implementation UITableView (Analysic)


+(void)load{
	Class class = [self class];
	SEL originalSelector = @selector(setDelegate:);
	SEL replacementSelector = @selector(TC_setDelegate:);
	
	Method originalMethod = class_getInstanceMethod(class, originalSelector);
	Method replacementMethod = class_getInstanceMethod(class, replacementSelector);
	
	method_exchangeImplementations(originalMethod, replacementMethod);
}



-(void)TC_setDelegate:(id<UITableViewDelegate>)delegate{

	[self TC_setDelegate:delegate];
	
	Class class = [delegate class];
	
	if (class_addMethod(class, NSSelectorFromString(@"TC_didSelectRowAtIndexPath"), (IMP)TC_didSelectRowAtIndexPath, "v@:@@")) {
		Method dis_originalMethod = class_getInstanceMethod(class, NSSelectorFromString(@"TC_didSelectRowAtIndexPath"));
		Method dis_replacementMethod = class_getInstanceMethod(class, @selector(tableView:didSelectRowAtIndexPath:));
		
		method_exchangeImplementations(dis_originalMethod, dis_replacementMethod);
	}
	
}

void TC_didSelectRowAtIndexPath(id self,SEL _cmd,id tableView, id indexpath){
	
	//统计
	NSLog(@"===========");
	NSLog(@"点击了Cell");
	NSLog(@"===========");
	
	SEL selector = NSSelectorFromString(@"TC_didSelectRowAtIndexPath");
	((void(*)(id,SEL,id,id))objc_msgSend)(self,selector,tableView,indexpath);
	
}



@end
