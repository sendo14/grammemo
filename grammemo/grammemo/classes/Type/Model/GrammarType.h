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

@property (nonatomic, assign) BOOL isShow;

+ (instancetype)typeWithDict:(NSDictionary *)dict;

- (void)matchGrammarFromText:(NSString *)text;

@end
