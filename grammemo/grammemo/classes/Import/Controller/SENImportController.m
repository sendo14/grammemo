//
//  SENImportController.m
//  grammemo
//
//  Created by sendo on 16/11/29.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENImportController.h"

@interface SENImportController ()

@property (weak, nonatomic) IBOutlet UIWebView *testWebView;

@property (nonatomic, strong) NSString *content;

@end

@implementation SENImportController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviItem];
    
    NSString *testURL = @"http://www.baidu.com";
    [self.testWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:testURL]]];
}

- (void)setNaviItem{
    self.view.backgroundColor = SENGlobalColor;
    self.navigationItem.title = @"导入文章";
    
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"backBtn_click"] forState:UIControlStateHighlighted];
    [backBtn sizeToFit];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    UIButton *importBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [importBtn setTitle:@"import" forState:UIControlStateNormal];
    [importBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [importBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [importBtn sizeToFit];
    [importBtn addTarget:self action:@selector(importBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:importBtn];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)importBtnClick{

}

- (void)getHTMLFromWebsite:(NSString *)website{
    //一句代码就可获得远程网页html源码。 注意会block主线程。
    NSString *appConnect = [[NSString alloc]
                             initWithContentsOfURL:[NSURL URLWithString:website]
                             encoding:NSUTF8StringEncoding
                             error:nil];
//    NSLog(@"%@",appConnect);
    self.content = appConnect;
//    return appConnect;
}

- (NSArray *)getTextFromHTMLContent:(NSString *)content{
    //使用正则表达式去掉html中的标签元素,获得纯文本
    //content是根据网址获得的网页源码字符串
    
    NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n" options:0 error:nil];
    
    content=[regularExpretion stringByReplacingMatchesInString:content options:NSMatchingReportProgress range:NSMakeRange(0, content.length) withTemplate:@"-"];//替换所有html和换行匹配元素为"-"
    
    regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"-{1,}" options:0 error:nil] ;
    content = [regularExpretion stringByReplacingMatchesInString:content options:NSMatchingReportProgress range:NSMakeRange(0, content.length) withTemplate:@"-"];//把多个"-"匹配为一个"-"
    
    
    //根据"-"分割到数组
    NSArray *arr=[NSArray array];
    content=[NSString stringWithString:content];
    arr =  [content componentsSeparatedByString:@"-"];
    NSMutableArray *marr=[NSMutableArray arrayWithArray:arr];
    [marr removeObject:@""];
    NSLog(@"%@",marr);
    return  marr;
}

@end
