//
//  SENMainViewController.m
//  grammemo
//
//  Created by sendo on 16/11/30.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENMainViewController.h"
//#import "SENGroupController.h"
#import "SENPopView.h"
//#import "YBPopupMenu.h"

#import "SENImportController.h"
#import "SENHistoryController.h"
#import "SENTypeController.h"
#import "SENExplainController.h"

#define SENRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define SENGlobalColor SENRGBColor(255, 255, 155)

@interface SENMainViewController ()
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UIButton *typeButton;

@property (strong, nonatomic) IBOutlet UIControl *mainView;

@end

@implementation SENMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SENGlobalColor;
    self.navigationItem.title = @"grammemo";
#warning 为什么viewController可以设置navigationitem ？
    
    [self setupBarButton];
//    [self setupDetailTextView];
    
    // 加载最新的历史数据，如果是第一次，加载例文
    
    NSString *searchText = @"も";
    [self highlightText:searchText inTextView:self.contentTextView];
}


- (NSArray *)rangesOfString:(NSString *)searchString inString:(NSString *)str {
        
        NSMutableArray *results = [NSMutableArray array];
        
        NSRange searchRange = NSMakeRange(0, [str length]);
        
        NSRange range;
        
        while ((range = [str rangeOfString:searchString options:0 range:searchRange]).location != NSNotFound) {
            
            [results addObject:[NSValue valueWithRange:range]];
            
            searchRange = NSMakeRange(NSMaxRange(range), [str length] - NSMaxRange(range));
            
        }
        
        return results;
    }

- (void)highlightText:(NSString *)searchText inTextView:(UITextView *)textView{
    
    NSString *contents = textView.text;
    
    NSArray *arrayJP = @[@"もの",@"です",@"こと",@"が"];
    for (NSString *JP in arrayJP) {
        NSRange range = [contents rangeOfString:JP];//匹配得到的下标
        NSLog(@"rang:%@",NSStringFromRange(range));
        //            contents = [contents substringWithRange:range];//截取范围内的字符串
        //            NSLog(@"截取的值为：%@",contents);
    }
    
    //捕获UITextView中得当前文本，并计算文本的长度
    [self.contentTextView.text length];
    //1.首先，得到一个textview的attributedText的可变拷贝，
    NSMutableAttributedString *attriText = [_contentTextView.attributedText mutableCopy];
    
    //2.然后，创建一个整个文本长度的NSRange，并删除已经有背景色的文本的背景色，
    NSRange atrriTextRange = NSMakeRange(0, attriText.length);
    [attriText removeAttribute:NSBackgroundColorAttributeName range:atrriTextRange];
    
    //3.匹配和替换，获取一个存放正则表达式与textview中文本匹配的所有匹配项的数组。
    
    NSString *matchRegex = @"\\b\(searchText)\\b";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:matchRegex options:0 error:nil];
    
    
    //    for(NSTextCheckingResult *result in [matches objectEnumerator]){
    //
    //        NSRange matchRange = [result range];
    //
    //    }
    
    if (regex) {
        NSRange range = NSMakeRange(0, [textView.text accessibilityElementCount]);
        
        NSArray *matches = [regex matchesInString:contents options:0 range:range];
        
        
        //4. 轮询每一个匹配项（把它们转换成NSTextCheckingResult对象），并为每一项添加黄色背景
        for (NSTextCheckingResult *match in matches) {
            NSRange matchRange = match.range;
            [attriText addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:matchRange];
        }
    }
    
    
    //5.最后，用高亮的结果更新UITextView。
//    textView.attributedText = [attriText copy];
    
}


- (void)setupBarButton{
    // 设置左右的button
    
#warning 为什么不能直接itemwithxxx ？
    UIButton *grammarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [grammarButton setImage:[UIImage imageNamed:@"more_24"] forState:UIControlStateNormal];
    [grammarButton setImage:[UIImage imageNamed:@"more_24_click"] forState:UIControlStateHighlighted];
    [grammarButton sizeToFit];
    [grammarButton addTarget:self action:@selector(showAllGrammar) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:grammarButton];
    
    UIButton *groupButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [groupButton setImage:[UIImage imageNamed:@"标签_24"] forState:UIControlStateNormal];
    [groupButton setImage:[UIImage imageNamed:@"标签_24_click"] forState:UIControlStateHighlighted];
    [groupButton sizeToFit];
    [groupButton addTarget:self action:@selector(popGroup) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:groupButton];
}

- (void)showAllGrammar{
#warning 为什么不能push ？为什么不是navigationController也可以直接调用self. ？
    NSLog(@"showAllGrammar");
}

- (void)popGroup{
    SENPopView *popView = [SENPopView guideView];
    popView.frame = self.view.frame;
    [self.view addSubview:popView];
    
//    if (<#condition#>) {
//        [popView removeFromSuperview];
//    }
    
    //原来的背景变暗一点、或新的view添加阴影
    //点击背景收回
    //再次点击按钮收回

    popView.pushBlock = ^(VCType type){
        switch (type) {
            case ImportVC:
            {
                SENImportController *vc = [[SENImportController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case HistoryVC:
            {
                SENHistoryController *vc = [[SENHistoryController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case TypeVC:
            {
                SENTypeController *vc = [[SENTypeController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case ExplainVC:
            {
                SENExplainController *vc = [[SENExplainController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
        }

    };
}

- (void)setupDetailTextView{
    // 加阴影
    self.detailTextView.layer.masksToBounds = NO;
    self.detailTextView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.detailTextView.layer.shadowOpacity = 0.5f; // 不透明度
    self.detailTextView.layer.shadowOffset = CGSizeMake(0.0f, 0.5f); // 位移
}





@end
