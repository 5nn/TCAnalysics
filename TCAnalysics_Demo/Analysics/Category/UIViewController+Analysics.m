//
//  UIViewController+Analysics.m
//  TCAccount
//
//  Created by TailCat on 16/1/20.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import "UIViewController+Analysics.h"
#import <objc/runtime.h>
#import "PageAnalysicDBManager.h"
#import "PageAnalysicModel.h"
#import "NSDate+Format.h"


@implementation UIViewController (Analysics)

+(void)load{
	Class class = [self class];
	SEL originalSelector = @selector(viewWillAppear:);
	SEL replacementSelector = @selector(TC_viewWillAppear:);
	
	Method originalMethod = class_getInstanceMethod(class, originalSelector);
	Method replacementMethod = class_getInstanceMethod(class, replacementSelector);
	
	method_exchangeImplementations(originalMethod, replacementMethod);
	
	
	SEL originalSelector2 = @selector(viewWillDisappear:);
	SEL replacementSelector2 = @selector(TC_viewWillDisappear:);
	
	Method originalMethod2 = class_getInstanceMethod(class, originalSelector2);
	Method replacementMethod2 = class_getInstanceMethod(class, replacementSelector2);
	
	method_exchangeImplementations(originalMethod2, replacementMethod2);
	
}

-(void)TC_viewWillAppear:(BOOL)animated{
	
	PageAnalysicModel *model = [[PageAnalysicModel alloc] init];
	model.viewControllerName = [self description];
	model.enterTime = [NSDate stringWithDate:[NSDate date]];
	
	[PageAnalysicDBManager insertPageAnalysicModel:model];
	
}

-(void)TC_viewWillDisappear:(BOOL)animated{
	
	PageAnalysicModel *model = [[PageAnalysicModel alloc] init];
	model.viewControllerName = [self description];
	model.leaveTime = [NSDate stringWithDate:[NSDate date]];
	
	[PageAnalysicDBManager insertPageAnalysicModel:model];
}


@end
