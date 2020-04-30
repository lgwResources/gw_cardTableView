//
//  ViewController.m
//  gw_cardTableView
//
//  Created by 刘功武 on 2020/4/30.
//  Copyright © 2020 _Coder. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCell+Extension.h"

static NSString * const infoCellId = @"infoCell";

#define gw_screenHeight    ([UIScreen mainScreen].bounds.size.height)
#define gw_screenWidth     ([UIScreen mainScreen].bounds.size.width)

#define UIColorFromRGBA(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1]

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *sections;
@end

@implementation ViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, 64, gw_screenWidth-30, gw_screenHeight-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)sections {
    if (!_sections) {
        _sections = @[@4,@1,@3,@4,@2,@4,@8];
    }
    return _sections;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:infoCellId];
    
    self.view.backgroundColor = UIColorFromRGBA(0xfff6f6f6);
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sections[section] integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *infoCell = [tableView dequeueReusableCellWithIdentifier:infoCellId];
    infoCell.backgroundColor = [UIColor clearColor];
    infoCell.textLabel.textColor = UIColorFromRGBA(0xff2c2c2c);
    infoCell.textLabel.text = [NSString stringWithFormat:@"第%ld组%ld行",indexPath.section,indexPath.row];
    return infoCell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [cell addSectionCornerWithTableView:tableView tableViewCell:cell indexPath:indexPath cornerRadius:6.f];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view    = [[UIView alloc] initWithFrame:CGRectMake(0, 0, gw_screenWidth, 40)];
    view.backgroundColor = UIColorFromRGBA(0xfff6f6f6);
    UILabel *title  = [[UILabel alloc] initWithFrame:view.bounds];
    title.textAlignment = NSTextAlignmentLeft;
    title.font      = [UIFont systemFontOfSize:15.f];
    title.textColor = UIColorFromRGBA(0xff2c2c2c);
    title.text      = [NSString stringWithFormat:@"第%d组",(int)section];
    [view addSubview:title];
    return view;
}



@end
