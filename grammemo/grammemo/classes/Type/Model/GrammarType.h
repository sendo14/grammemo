//
//  GrammarType.h
//  grammemo
//
//  Created by sendo on 16/10/12.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GrammarType : NSObject

@property (nonatomic, strong) NSString *JP;
@property (nonatomic, strong) NSString *CN;
@property (nonatomic, strong) NSString *Type;
@property (nonatomic, strong) NSString *Detail;
@property (nonatomic, strong) NSString *Index;

@property (nonatomic, strong) NSString *content;

+ (instancetype)typeWithDict:(NSDictionary *)dict;

- (NSString *)matchGrammarFromText:(NSString *)text;
- (GrammarType *)matchGrammarType;

@end
