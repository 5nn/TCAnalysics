//
//  simpleViewController.m
//  TCAnalysics_Demo
//
//  Created by TailCat on 16/1/21.
//  Copyright © 2016年 TailCat. All rights reserved.
//


#import "simpleViewController.h"
#import "PageAnalysicModel.h"
#import "TCAnalysic.h"



@interface simpleViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *whiteView;

@end

@implementation simpleViewController
-(void)viewDidLoad{
	[super viewDidLoad];
	
	UITapGestureRecognizer *redViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickRedView)];
	UITapGestureRecognizer *whiteViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBlackView)];
	
	[self.redView addGestureRecognizer:redViewTap];
	[self.whiteView addGestureRecognizer:whiteViewTap];
	
}

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
}

-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
}

- (IBAction)onClickBtn:(id)sender {
	
	NSLog(@"===========");
	NSLog(@"触发点击了button");
	NSLog(@"===========");
	
}

-(void)onClickRedView{
	NSLog(@"===========");
	NSLog(@"点击了红色vidw");
	NSLog(@"===========");
}

/** 手动添加打点事件测试  */
-(void)onClickBlackView{

	[TCAnalysic insertAnalysicWithName:@"手动统计" withActionName:@"手动统计"];

}

@end
