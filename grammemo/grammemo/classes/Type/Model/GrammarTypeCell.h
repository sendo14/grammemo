//
//  GrammarTypeCell.h
//  grammemo
//
//  Created by sendo on 16/11/30.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GrammarType.h"

@interface GrammarTypeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *textJP;
@property (weak, nonatomic) IBOutlet UILabel *textCN;

@property (nonatomic, strong) GrammarType *grammarType;

@end
