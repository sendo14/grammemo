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
    self.textJP.text = grammarType.JP;
    self.textCN.text = grammarType.CN;
}

@end
