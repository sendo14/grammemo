//
//  SENDetailController.m
//  grammemo
//
//  Created by sendo on 16/11/29.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENDetailController.h"

@interface SENDetailController ()
@property (weak, nonatomic) IBOutlet UITextView *detailView;

@end

@implementation SENDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     _detailView.text = self.text;
}


@end
