//
//  SENMainViewController.h
//  grammemo
//
//  Created by sendo on 16/11/30.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SENMainViewController : UIViewController

@property (nonatomic, strong) void (^popBlock)(UINavigationController *);

@end
