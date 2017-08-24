//
//  ExampleView6.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/18.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "ExampleView6.h"

@interface ExampleViewCell6 : UITableViewCell <ZATableViewCellDelegate>
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *view0;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@property (nonatomic, strong) UIView *view4;
@end

@implementation ExampleViewCell6

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    
    return self;
}

-(void)setupViews
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView lgb_AddSubviews:@[
                                        self.label,
                                        self.view0,
                                        self.view1, self.view2, self.view3,
//                                        self.view4
                                        ]];
    
    self.contentView.lgb_Layout
    .alignToViewLeft(self, 0)
    .alignToViewTop(self, 0)
    .alignToViewRight(self, 0)
    .alignToViewBottom(self.view3, 10);
    
//    self.contentView.backgroundColor = [UIColor yellowColor];
    
    
    self.view0.lgb_Layout
    .spaceToViewLeft(self.contentView, 10)
    .spaceToViewTop(self.contentView, 10)
    .isWidth(50)
    .isHeight(50);
    
//    return;
    
    self.view1.lgb_Layout
    .spaceToViewLeft(self.view0, 10)
    .spaceToViewTop(self.contentView, 10)
    .spaceToViewRight(self.contentView, 10)
    .heightRatioToView(self.view0, 0.4);
    
    self.label.lgb_Layout
    .spaceToViewTop(self.view1, 10)
    .spaceToViewLeft(self.view0, 10)
    .spaceToViewRight(self.contentView, 60)
    .isHeight(0);
    
    self.view2.lgb_Layout
    .spaceToViewTop(self.view1, 10)
    .spaceToViewLeft(self.label, 10)
    .spaceToViewRight(self.contentView, 10)
    .heightRatioToView(self.label, 1);
    
    self.view3.lgb_Layout
    .spaceToViewLeft(self.view0, 10)
    .spaceToViewTop(self.label, 10)
    .widthRatioToView(self.label, 0.7)
    .heightRatioToView(self.label, 0.5);
}

-(void)zaConfigCellWithData:(id)data
{
    self.label.text = data;
}

-(UILabel *)label
{
    if (_label == nil) {
        _label = [UILabel new];
        _label.backgroundColor = [UIColor brownColor];
        _label.numberOfLines = 0;
    }
    return _label;
}

-(UIView *)view0
{
    if (_view0 == nil) {
        _view0 = [UIView new];
        _view0.backgroundColor = [UIColor redColor];
    }
    return _view0;
}

-(UIView *)view1
{
    if (_view1 == nil) {
        _view1 = [UIView new];
        _view1.backgroundColor = [UIColor grayColor];
    }
    return _view1;
}

-(UIView *)view2
{
    if (_view2 == nil) {
        _view2 = [UIView new];
        _view2.backgroundColor = [UIColor orangeColor];
    }
    return _view2;
}

-(UIView *)view3
{
    if (_view3 == nil) {
        _view3 = [UIView new];
        _view3.backgroundColor = [UIColor purpleColor];
    }
    return _view3;
}

-(UIView *)view4
{
    if (_view4 == nil) {
        _view4 = [UIView new];
        _view4.backgroundColor = [UIColor yellowColor];
    }
    return _view4;
}


@end

@interface ExampleView6 () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation ExampleView6

#pragma mark ------------------------------------------------- 初始化 ---------------------------------------------------
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

#pragma mark ------------------------------------------------- 代理方法 -------------------------------------------------

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView lgb_getHeightOfCellClass:[ExampleViewCell6 class] data:self.data[indexPath.row]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExampleViewCell6 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell == nil) {
        cell = [[ExampleViewCell6 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    [cell zaConfigCellWithData:self.data[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.data removeObjectAtIndex:indexPath.row];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView endUpdates];
        
        
    }
}

#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------
-(void)setupData:(NSArray *)data
{
    [self.data removeAllObjects];
    [self.data addObjectsFromArray:data];
    ZA_logInteger(data.count);
    [self.tableView reloadData];
}
#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------

#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------
-(void)setupViews
{
    [self addSubview:self.tableView];
    
    self.tableView.lgb_Layout
    .spaceToViewLeft(self, 0)
    .spaceToViewTop(self, 0)
    .spaceToViewRight(self, 0)
    .spaceToViewBottom(self, 0);
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}

-(NSMutableArray *)data
{
    if (_data == nil) {
        _data = [NSMutableArray array];
    }
    return _data;
}

@end
