//
//  Example5.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/18.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "Example5.h"

@interface Example5 ()
@property (nonatomic, strong) UILabel *lb;
@end

@implementation Example5

#pragma mark ------------------------------------------------- 生命周期 -------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

#pragma mark ------------------------------------------------- 代理方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------
-(void)changeText
{
    self.lb.text = [self.lb.text stringByAppendingString:self.lb.text];
    
    [self.lb.lgb_Layout updateLayout];
}
#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------
-(void)setupViews
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(changeText)];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.lb.lgb_Layout
    .centerEqualToViewX(self.view, 0)
    .spaceToViewTop(self.view, 100)
    .isMaxWidth(300)
    .isHeight(30);
    
    [self.view addSubview:self.lb];
    
    self.lb.text = @"对方";
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(UILabel *)lb
{
    if (_lb == nil) {
        _lb = [UILabel new];
        _lb.numberOfLines = 0;
        _lb.backgroundColor = [UIColor orangeColor];
    }
    return _lb;
}

@end
