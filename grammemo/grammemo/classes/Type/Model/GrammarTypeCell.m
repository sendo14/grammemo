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
    
    self.textLabel.textColor = SENRGBColor(55, 55, 55);
    self.detailTextLabel.textColor = SENRGBColor(155, 155, 155);
}

@end
