//
//  SENPopViewController.h
//  grammemo
//
//  Created by sendo on 16/12/29.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, VCType) {
    VCTypeImport,
    VCTypeHistory,
    VCTypeType,
    VCTypeExplain,
};

@interface SENPopViewController : UIViewController

@property (nonatomic, copy) void (^pushBlock)(VCType type);

@end
