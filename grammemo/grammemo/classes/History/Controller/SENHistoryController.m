//
//  SENHistoryController.m
//  grammemo
//
//  Created by sendo on 16/11/29.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENHistoryController.h"
#import "SENHistoryCell.h"

static NSString * const cellID = @"HistoryCell";

@interface SENHistoryController ()

@end

@implementation SENHistoryController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SENHistoryCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    [self setNaviItem];

}

- (void)setNaviItem{
    self.view.backgroundColor = SENGlobalColor;
    self.tableView.separatorStyle = NO;
    
    self.navigationItem.title = @"历史记录";
    
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"backBtn_click"] forState:UIControlStateHighlighted];
    [backBtn sizeToFit];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SENHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

@end
