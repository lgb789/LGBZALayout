//
//  ExampleView11.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/23.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "ExampleView11.h"
#import "ExampleModel11.h"

@interface ExampleViewCell11 : UITableViewCell <ZATableViewCellDelegate>
@property (nonatomic, strong) UILabel *timeLb;
@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *detailLb;
@property (nonatomic, strong) UIImageView *preImageView;
@end

@implementation ExampleViewCell11

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    
    return self;
}

-(void)zaConfigCellWithData:(id)data
{
    ExampleModel11 *model = (ExampleModel11 *)data;
    
    self.timeLb.text = model.date;
    self.titleLb.text = model.title;
    self.detailLb.text = model.detail.length > 50 ? [model.detail substringToIndex:50] : model.detail;
    
    if (model.image) {
        self.preImageView.image = [UIImage imageNamed:model.image];
        
        self.preImageView.lgb_Layout
        .isWidth(80)
        .isHeight(80);
    }else{
        self.preImageView.image = nil;
        
        self.preImageView.lgb_Layout
        .isWidth(0)
        .isHeight(0);
    }
}

-(void)setupViews
{
    [self.contentView lgb_AddSubviews:@[
                                        self.timeLb,
                                        self.container
                                        ]];
    
    [self.container lgb_AddSubviews:@[
                                      self.titleLb,
                                      self.detailLb,
                                      self.preImageView
                                      ]];
    
    self.contentView.lgb_Layout
    .alignToViewLeft(self, 0)
    .alignToViewTop(self, 0)
    .alignToViewRight(self, 0)
    .alignToViewBottom(self.container, 10);
    
    self.timeLb.lgb_Layout
    .centerEqualToViewX(self.contentView, 0)
    .spaceToViewTop(self.contentView, 15)
    .isHeight(20)
    .isWidth(0);
    
    self.container.lgb_Layout
    .spaceToViewTop(self.timeLb, 10)
    .spaceToViewLeft(self.contentView, 20)
    .spaceToViewRight(self.contentView, 20)
    .alignToViewArrayBottom(@[self.detailLb, self.preImageView], 10);
//    .isHeight(230);
//    .alignToViewBottom(self.detailLb, 10);
    
    self.titleLb.lgb_Layout
    .spaceToViewLeft(self.container, 15)
    .spaceToViewTop(self.container, 10)
    .spaceToViewRight(self.preImageView, 10)
    .isHeight(20);
    
    self.detailLb.lgb_Layout
    .alignToViewLeft(self.container, 15)
    .spaceToViewTop(self.titleLb, 10)
    .spaceToViewRight(self.preImageView, 10)
    .isHeight(0);
    
    self.detailLb.tag = 1003;
    self.container.tag = 1002;
    self.contentView.tag = 1001;
    
    self.preImageView.lgb_Layout
    .alignToViewTop(self.titleLb, 0)
    .spaceToViewRight(self.container, 15);
    
    
}

-(UILabel *)timeLb
{
    if (_timeLb == nil) {
        _timeLb = [UILabel new];
        _timeLb.backgroundColor = ZA_rgb(205, 206, 205);
        _timeLb.textColor = [UIColor whiteColor];
        _timeLb.layer.cornerRadius = 5;
        _timeLb.layer.masksToBounds = YES;

        
    }
    return _timeLb;
}

-(UIView *)container
{
    if (_container == nil) {
        _container = [UIView new];
        _container.backgroundColor = [UIColor whiteColor];
        _container.layer.cornerRadius = 10;
        _container.layer.borderWidth = 0.5;
        _container.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
    }
    return _container;
}

-(UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [UILabel new];
        _titleLb.textColor = [UIColor blackColor];

    }
    return _titleLb;
}

-(UILabel *)detailLb
{
    if (_detailLb == nil) {
        _detailLb = [UILabel new];
        _detailLb.textColor = [UIColor grayColor];
        _detailLb.numberOfLines = 0;
    }
    return _detailLb;
}

-(UIImageView *)preImageView
{
    if (_preImageView == nil) {
        _preImageView = [UIImageView new];
        _preImageView.contentMode = UIViewContentModeScaleAspectFill;
        _preImageView.clipsToBounds = YES;
    }
    return _preImageView;
}

@end

@interface ExampleView11 () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation ExampleView11

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
    return [tableView lgb_getHeightOfCellClass:[ExampleViewCell11 class] data:self.data[indexPath.row]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExampleViewCell11 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell == nil) {
        cell = [[ExampleViewCell11 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    [cell zaConfigCellWithData:self.data[indexPath.row]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------
-(void)setupData:(NSArray *)data
{
    [self.data removeAllObjects];
    
    [self.data addObjectsFromArray:data];
    
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
