//
//  SENGroupController.m
//  grammemo
//
//  Created by sendo on 16/11/29.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENGroupController.h"

@interface SENGroupController ()

@property (nonatomic, strong) NSArray *groupName;
@property (nonatomic, strong) NSArray *segueIdentifier;

@end

@implementation SENGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.groupName = @[@"导入文章",@"历史记录",@"语法种类",@"使用说明"];
    self.segueIdentifier = @[@"Import",@"History",@"Type",@"Explain"];
}



#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [self.groupName count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.定义一个cell的标识,在stroyborad里绑定cell
    static NSString *ID = @"groupCell";
    
    // 2.从缓存池中取出cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.如果缓存池中没有cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 4.配置cell
    
    cell.textLabel.text = self.groupName[indexPath.row];
    cell.textLabel.textColor = [UIColor grayColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = self.segueIdentifier[indexPath.row];

    [self performSegueWithIdentifier:identifier sender:nil];
}

@end
