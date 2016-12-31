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
        self.pushBlock(VCTypeImport);
    }
}

- (IBAction)historyBtn:(id)sender {
    if (self.pushBlock) {
        self.pushBlock(VCTypeHistory);
    }
}

- (IBAction)typeBtn:(id)sender {
    if (self.pushBlock) {
        self.pushBlock(VCTypeType);
    }
}

- (IBAction)explainBtn:(id)sender {
    if (self.pushBlock) {
        self.pushBlock(VCTypeExplain);
    }
}



@end
