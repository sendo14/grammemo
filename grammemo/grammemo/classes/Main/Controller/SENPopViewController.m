//
//  SENPopViewController.m
//  grammemo
//
//  Created by sendo on 16/12/29.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENPopViewController.h"

@interface SENPopViewController ()

@end

@implementation SENPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)importBtn:(id)sender {
    if (self.pushBlock) {
        self.pushBlock(ImportVC);
    }
}

- (IBAction)historyBtn:(id)sender {
    if (self.pushBlock) {
        self.pushBlock(HistoryVC);
    }
}

- (IBAction)typeBtn:(id)sender {
    if (self.pushBlock) {
        self.pushBlock(TypeVC);
    }
}

- (IBAction)explainBtn:(id)sender {
    if (self.pushBlock) {
        self.pushBlock(ExplainVC);
    }
}



@end
