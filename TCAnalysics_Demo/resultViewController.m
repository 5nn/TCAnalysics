//
//  resultViewController.m
//  TCAnalysics_Demo
//
//  Created by TailCat on 16/1/22.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import "resultViewController.h"
#import "TCAnalysic.h"


@interface resultViewController ()

@end

@implementation resultViewController

-(void)viewDidLoad{
	[super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	[TCAnalysic logData];
}

@end
