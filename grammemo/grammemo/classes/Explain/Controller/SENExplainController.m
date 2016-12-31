//
//  SENExplainController.m
//  grammemo
//
//  Created by sendo on 16/11/29.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENExplainController.h"

@interface SENExplainController ()

@end

@implementation SENExplainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNaviItem];
}

- (void)setNaviItem{
    self.view.backgroundColor = SENGlobalColor;
    
    self.navigationItem.title = @"使用说明";
    
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


@end
