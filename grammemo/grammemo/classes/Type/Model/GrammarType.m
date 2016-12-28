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


- (void)matchGrammarFromText:(NSString *)text{
    
    //取得当前控制器显示的文本
    
    //遍历文本 in GrammarType
    
    //返回匹配的值在文本中的位置
    
    
    //2.匹配字符串
    // 匹配数组里的全部元素
    //按照字符串分割，取个数
    NSMutableArray *testArray = [NSMutableArray array];
    NSString *testString = [NSString string];
    
    NSArray *customArray = @[@"個性の重視",@"もの",@"です",@"こと",@"が"];
    NSString *lastStr = [NSString stringWithString:text];
    for (int i = 0; i < customArray.count; i ++) {
        
        NSString *seperatedStr = customArray[i];
        NSArray *strArray =[lastStr componentsSeparatedByString:seperatedStr];
        lastStr = [strArray componentsJoinedByString:@"/"];

        NSMutableString *resultStr = [NSMutableString stringWithString:text];
        NSInteger count = 0;
        NSRange range = [resultStr rangeOfString:seperatedStr];
        
        while (range.length) {
            NSLog(@"%@",NSStringFromRange(range));
            count ++;
            [resultStr deleteCharactersInRange:range];
            range = [resultStr rangeOfString:seperatedStr];
        }
//        NSMutableAttributedString *attri =
//        [attri  setAttributes:NSForegroundColorAttributeName range:range];
//        [testArray addObject:testString];
        
        NSLog(@"-------------%d个元素",count);
//        NSLog(@"%d",testArray.count);
    }
}


@end
