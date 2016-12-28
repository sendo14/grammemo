//
//  GrammarTypeCell.m
//  grammemo
//
//  Created by sendo on 16/11/30.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "GrammarTypeCell.h"

@implementation GrammarTypeCell

- (void)setGrammarType:(GrammarType *)grammarType
{
    _grammarType = grammarType;
    self.textLabel.text = grammarType.JP;
    self.detailTextLabel.text = grammarType.CN;
    
    self.textLabel.textColor = [UIColor colorWithRed:55/255.0 green:55/255.0 blue:55/255.0 alpha:1.0];
    self.detailTextLabel.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0];
}

@end
