//
//  SENPopView.m
//  grammemo
//
//  Created by sendo on 16/12/6.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENPopView.h"
#import "SENMainViewController.h"


@implementation SENPopView

- (void)awakeFromNib{
    
    
//    self.popView.layer.cornerRadius = 10;
//    self.popView.layer.masksToBounds = YES;

    self.popView.layer.masksToBounds = NO;
    self.popView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.popView.layer.shadowOpacity = 0.75f;
    self.popView.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
}

+ (instancetype)guideView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}



- (IBAction)importButton:(id)sender {
    if (self.pushBlock) {
        self.pushBlock(ImportVC);
    }
}
- (IBAction)historyButton:(id)sender {
    if (self.pushBlock) {
        self.pushBlock(HistoryVC);
    }
}
- (IBAction)typeButton:(id)sender {
    if (self.pushBlock) {
        self.pushBlock(TypeVC);
    }
}
- (IBAction)explainButton:(id)sender {
    if (self.pushBlock) {
        self.pushBlock(ExplainVC);
    }
}




@end
