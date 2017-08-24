//
//  MainController.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/17.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "MainController.h"
#import "LGBMainView.h"

@interface MainController () <LGBMainViewDelegate>
@property (nonatomic, strong) LGBMainView *mainView;
@end

@implementation MainController

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
-(void)mainView:(LGBMainView *)mainView didSelectdRow:(NSInteger)row
{
    Class class = NSClassFromString([NSString stringWithFormat:@"Example%ld", row]);
    id controller = [class new];
    
    [self.navigationController pushViewController:controller animated:YES];
}
#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------

#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------
-(void)setupViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainView];
    
    NSArray *data = @[
                      @[@"Example0", @"测试ZAFlame"],
                      @[@"Example1", @"动态改变view layout"],
                      @[@"Example2", @"自动计算label高度"],
                      @[@"Example3", @"设置label最大高度"],
                      @[@"Example4", @"自动计算label宽度"],
                      @[@"Example5", @"设置label最大宽度"],
                      @[@"Example6", @"计算table cell 高度"],
                      @[@"Example7", @"图文混排"],
                      @[@"Example8", @"设置scroll content height"],
                      @[@"Example9", @"设置scroll content width"],
                      @[@"Example10", @"2个cell图文混排"],
                      @[@"Example11", @"图文混排"],
                      @[@"Example12", @"align bottom"],
                      ];
    ZA_logFrame(self.mainView);
    [self.mainView setupData:data];
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(LGBMainView *)mainView
{
    if (_mainView == nil) {
        _mainView = [[LGBMainView alloc] initWithFrame:self.view.bounds];
        _mainView.delegate = self;
    }
    return _mainView;
}

@end
