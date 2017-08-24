//
//  Example2.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/18.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "Example2.h"
#import "ExampleView2.h"

@interface Example2 ()
@property (nonatomic, strong) ExampleView2 *exampleView;
@property (nonatomic, assign) BOOL isAdd;
@end

@implementation Example2

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
    UILabel *lb = self.exampleView.lb;
    self.isAdd = !self.isAdd;
    if (self.isAdd) {
        self.exampleView.lb.text = [lb.text stringByAppendingString:lb.text];
    }else{
        self.exampleView.lb.text = [lb.text substringToIndex:lb.text.length / 2];
    }
    
    [self.exampleView.lb.lgb_Layout updateLayout];
}
#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------
-(void)setupViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(changeText)];
    
    [self.view addSubview:self.exampleView];
    
    self.exampleView.lgb_Layout
    .centerEqualToViewX(self.view, 0)
    .spaceToViewTop(self.view, 80)
    .isWidth(200)
    .isHeight(200);
    
    self.exampleView.lb.text = @"电风扇等方法上独领风骚的快乐放假阿拉斯加分";
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(ExampleView2 *)exampleView
{
    if (_exampleView == nil) {
        _exampleView = [ExampleView2 new];
    }
    return _exampleView;
}

@end
