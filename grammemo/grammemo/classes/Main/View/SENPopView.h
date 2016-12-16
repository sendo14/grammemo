//
//  SENPopView.h
//  grammemo
//
//  Created by sendo on 16/12/6.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, VCType) {
    ImportVC,
    HistoryVC,
    TypeVC,
    ExplainVC,
};

@interface SENPopView : UIView
@property (weak, nonatomic) IBOutlet UIView *popView;

@property (nonatomic, copy) void (^pushBlock)(VCType type);

+ (instancetype)guideView;
@end
