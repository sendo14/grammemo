//
//  SENMainViewController.m
//  grammemo
//
//  Created by sendo on 16/11/30.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENMainViewController.h"
#import "SENImportController.h"
#import "SENHistoryController.h"
#import "SENTypeController.h"
#import "SENExplainController.h"
#import "SENPopViewController.h"

#import "GrammarType.h"

@interface SENMainViewController () <UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UIButton *typeButton;

@property (strong, nonatomic) IBOutlet UIControl *mainView;
@property (nonatomic, strong) SENPopViewController *popVC;

@end

@implementation SENMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SENGlobalColor;
    self.navigationItem.title = @"grammemo";
#warning 为什么viewController可以设置navigationitem ？
    
    [self setupBarBtn];
//    [self setupDetailTextView];
    
    // 加载最新的历史数据，如果是第一次，加载例文
    
    // pipei
    GrammarType *gram = [[GrammarType alloc] init];
    [gram matchGrammarFromText:self.contentTextView.text];

}

- (void)highlightText:(NSString *)searchText inTextView:(UITextView *)textView{
    
    NSString *contents = textView.text;
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

- (void)setupBarBtn{
    // 设置左右的button
    
#warning 为什么不能直接itemwithxxx ？
//    UIButton *grammarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [grammarBtn setImage:[UIImage imageNamed:@"popBtn"] forState:UIControlStateNormal];
//    [grammarBtn setImage:[UIImage imageNamed:@"popBtn_click"] forState:UIControlStateHighlighted];
//    [grammarBtn sizeToFit];
//    [grammarBtn addTarget:self action:@selector(showAllGrammar) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:grammarBtn];
    
    UIButton *popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [popBtn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [popBtn setImage:[UIImage imageNamed:@"menu_click"] forState:UIControlStateHighlighted];
    [popBtn sizeToFit];
    [popBtn addTarget:self action:@selector(popBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:popBtn];
}

- (void)showAllGrammar{
#warning 为什么不能push ？为什么不是navigationController也可以直接调用self. ？
    NSLog(@"showAllGrammar");
}



-(void)popBtnClick:(UIButton *)sender{
    self.popVC = [[SENPopViewController alloc] init];
    
    // 设置弹出的样式为popover
    self.popVC.modalPresentationStyle = UIModalPresentationPopover;
    // 设置弹出控制器的尺寸
    self.popVC.preferredContentSize = CGSizeMake(150, 150);
    
    // 设置popoverPresentationController的sourceRect和sourceView属性
    self.popVC.popoverPresentationController.sourceRect = sender.bounds;
    self.popVC.popoverPresentationController.sourceView = sender;
    
    // 设置箭头方向
    self.popVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    // 设置背景色,包括箭头
    self.popVC.popoverPresentationController.backgroundColor = [UIColor whiteColor];
    self.popVC.popoverPresentationController.delegate = self;
    
    // 弹出
    [self presentViewController:self.popVC animated:YES completion:nil];

    // 点击按钮
    self.popVC.pushBlock = ^(VCType type){
        switch (type) {
            case VCTypeImport:
            {
                //关闭popover
                [self dismissViewControllerAnimated:YES completion:nil];
                SENImportController *vc = [[SENImportController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case VCTypeHistory:
            {
                [self dismissViewControllerAnimated:YES completion:nil];
                SENHistoryController *vc = [[SENHistoryController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case VCTypeType:
            {
                [self dismissViewControllerAnimated:YES completion:nil];
                SENTypeController *vc = [[SENTypeController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case VCTypeExplain:
            {
                [self dismissViewControllerAnimated:YES completion:nil];
                SENExplainController *vc = [[SENExplainController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
        }
        
    };
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}

- (void)setupDetailTextView{
    // 加阴影
    self.detailTextView.layer.masksToBounds = NO;
    self.detailTextView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.detailTextView.layer.shadowOpacity = 0.5f; // 不透明度
    self.detailTextView.layer.shadowOffset = CGSizeMake(0.0f, 0.5f); // 位移
}





@end
