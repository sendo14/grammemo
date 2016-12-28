//
//  SENTypeController.m
//  grammemo
//
//  Created by sendo on 16/11/29.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENTypeController.h"
#import "GrammarType.h"
#import "GrammarTypeCell.h"
#import "SENDetailController.h"

static NSString * const cellID = @"TypeCell";

@interface SENTypeController ()

@property (nonatomic, strong) NSMutableDictionary *dicts;
@property (nonatomic, strong) NSArray *keys;

@end

@implementation SENTypeController

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadGrammarType];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GrammarTypeCell class]) bundle:nil] forCellReuseIdentifier:cellID];
}

- (void)loadGrammarType{
    if (!_dicts) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"GrammarType.plist" ofType:nil];
        self.dicts = [NSMutableDictionary dictionaryWithContentsOfFile:path];
        self.keys = [[self.dicts allKeys] sortedArrayUsingSelector:@selector(compare:)];
        
        for (NSString *key in self.keys) {
            NSMutableArray *dataArray = [NSMutableArray array];
            NSArray *dicArray =  self.dicts[key];
            for (NSDictionary *dic in dicArray) {
                GrammarType *grammarType = [GrammarType typeWithDict:dic];
                [dataArray addObject:grammarType];
            }
            [self.dicts setValue:dataArray forKey:key];
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.keys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    GrammarType *grammarType = [self.dicts[_keys] objectAtIndex:section];
//    if ([grammarType isShow]) {
//        return [self.dicts[_keys] count];
//    }else{
//        return  0;
//    }
    
    return [self.dicts[_keys[section]] count];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return self.keys[section];
}


// 定义头标题的视图，添加点击事件
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    GrammarType *grammarType = [self.dicts[_keys] objectAtIndex:section];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 320, 30);
    [btn setTitle:grammarType.Type forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.tag = section;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    if (section % 2) {
        btn.backgroundColor = [UIColor darkGrayColor];
    }else{
        btn.backgroundColor = [UIColor lightGrayColor];
    }
    return btn;
}
- (void) btnClick:(UIButton *)btn
{
    GrammarType *grammarType = [self.dicts[_keys] objectAtIndex:btn.tag];
    // 改变组的显示状态
    if ([grammarType isShow]) {
        [grammarType setIsShow:NO];
    }else{
        [grammarType setIsShow:YES];
    }
    // 刷新点击的组标题，动画使用卡片
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationFade];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    GrammarTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    GrammarType *grammarType = self.dicts[self.keys[indexPath.section]][indexPath.row];
    
    cell.grammarType = grammarType;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SENDetailController *detailVC = [[SENDetailController alloc] init];
    [self.navigationController pushViewController:detailVC animated:NO];
    
    GrammarType *grammarType = self.dicts[self.keys[indexPath.section]][indexPath.row];
    NSString *detailName = grammarType.JP;
    detailVC.navigationItem.title = detailName;
    detailVC.text = grammarType.Detail;
}




@end
