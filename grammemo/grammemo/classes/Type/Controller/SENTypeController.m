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
    
    return [self.dicts[_keys[section]] count];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return self.keys[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    GrammarTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    GrammarType *grammarType = self.dicts[self.keys[indexPath.section]][indexPath.row];
    
    cell.grammarType = grammarType;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
//    SENDetailController *detailVC = segue.destinationViewController;
    SENDetailController *detailVC = [[SENDetailController alloc] initWithNibName:[NSString stringWithFormat:@"SENDetailController"] bundle:nil];
    [self.navigationController pushViewController:detailVC animated:YES];
    
    GrammarType *grammarType = self.dicts[self.keys[indexPath.section]][indexPath.row];
    NSString *detailName = grammarType.JP;
    detailVC.navigationItem.title = detailName;
    detailVC.text = grammarType.Detail;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    SENDetailController *detailVC = [[SENDetailController alloc]init];
//    [self.navigationController pushViewController:detailVC animated:NO];
//}




@end
