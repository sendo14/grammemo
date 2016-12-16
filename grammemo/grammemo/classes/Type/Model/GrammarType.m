//
//  GrammarType.m
//  grammemo
//
//  Created by sendo on 16/10/12.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "GrammarType.h"

@implementation GrammarType

+ (instancetype)typeWithDict:(NSDictionary *)dict{
    
    GrammarType *grammarType = [[self alloc] init];
    [grammarType setValuesForKeysWithDictionary:dict];
    
    return grammarType;
}


- (NSString *)matchGrammarFromText:(NSString *)text{
    
    //取得当前控制器显示的文本
    
    //遍历文本 in GrammarType
    
    //返回匹配的值在文本中的位置
    
    
    //2.匹配字符串
    NSString *string = self.content;
    NSRange range = [string rangeOfString:self.JP];//匹配得到的下标
    NSLog(@"rang:%@",NSStringFromRange(range));
    string = [string substringWithRange:range];//截取范围内的字符串
    NSLog(@"截取的值为：%@",string);
    return string;
    
}

//- (GrammarType *)matchGrammarType{
//    
//    NSString *alreadyMatch;
//    NSString *type = [self matchGrammarFromText:alreadyMatch];
//    
//    return ;
//
//}

@end
