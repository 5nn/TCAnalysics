//
//  customTableViewController.m
//  TCAnalysics_Demo
//
//  Created by TailCat on 16/1/21.
//  Copyright © 2016年 TailCat. All rights reserved.
//

#import "customTableViewController.h"
#import "FirstTableViewCell.h"

static NSString * const kFirstTableViewCellId = @"kFirstTableViewCellId";
static CGFloat const kFirstTableViewCellHeight = 100.0f;

static NSString * const kSecondTableViewCellId = @"kSecondTableViewCellId";
static CGFloat const kSecondTableViewCellHeight = 44.0f;


@interface customTableViewController ()
<UITableViewDelegate,UITableViewDataSource>

@end

@implementation customTableViewController

-(void)viewDidLoad{
	[super viewDidLoad];
	
	self.tableView.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
}

-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
}



#pragma mark -Table View Delegate & DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.row == 0) {
		return kFirstTableViewCellHeight;
	}else{
		return kSecondTableViewCellHeight;
	}
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if (indexPath.row == 0) {
		FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFirstTableViewCellId];
		return cell;
	}else{
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSecondTableViewCellId];
		return cell;
	}
	
}




@end
