//
//  ExampleView10.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/21.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "ExampleView10.h"
#import "ExampleModel10.h"

@interface ExampleViewCell10_1 : UITableViewCell <ZATableViewCellDelegate>
@property (nonatomic, strong) UILabel *text;
@property (nonatomic, strong) UIImageView *photo;
@end

@implementation ExampleViewCell10_1

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
    ExampleModel10 *model = (ExampleModel10 *)data;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 5;
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:model.txt attributes:@{
                                                                                                NSParagraphStyleAttributeName:style
                                                                                                }];
    
    self.text.attributedText = str;
    
    self.photo.image = [UIImage imageNamed:model.img];
    
//    NSLog(@"config data....");
}

-(void)setupViews
{
    [self.contentView lgb_AddSubviews:@[self.text, self.photo]];
    
    self.contentView.lgb_Layout
    .alignToViewLeft(self, 0)
    .alignToViewTop(self, 0)
    .alignToViewRight(self, 0)
    .alignToViewArrayBottom(@[self.text, self.photo], 10);
//    .alignToViewBottom(self.text, 10);
    
    self.text.lgb_Layout
    .spaceToViewTop(self.contentView, 10)
    .spaceToViewLeft(self.contentView, 10)
    .widthRatioToView(self.contentView, 0.7)
    .isHeight(0);
    
    self.photo.lgb_Layout
    .alignToViewTop(self.text, 0)
    .spaceToViewLeft(self.text, 10)
    .spaceToViewRight(self.contentView, 10)
    .isHeight(0);
}

-(UILabel *)text
{
    if (_text == nil) {
        _text = [UILabel new];
        _text.backgroundColor = [UIColor clearColor];
        _text.numberOfLines = 0;
    }
    return _text;
}

-(UIImageView *)photo
{
    if (_photo == nil) {
        _photo = [UIImageView new];
    }
    return _photo;
}

@end

@interface ExampleViewCell10_2 : UITableViewCell <ZATableViewCellDelegate>
@property (nonatomic, strong) UILabel *text;
@property (nonatomic, strong) UIImageView *image1;
@property (nonatomic, strong) UIImageView *image2;
@property (nonatomic, strong) UIImageView *image3;
@end

@implementation ExampleViewCell10_2

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
    ExampleModel10 *model = (ExampleModel10 *)data;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 5;
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:model.txt attributes:@{
                                                                                                 NSParagraphStyleAttributeName:style
                                                                                                 }];
    
    self.text.attributedText = str;
    
    self.image1.image = [UIImage imageNamed:model.imgs[0]];
    self.image2.image = [UIImage imageNamed:model.imgs[1]];
    self.image3.image = [UIImage imageNamed:model.imgs[2]];
}

-(void)setupViews
{
    [self.contentView lgb_AddSubviews:@[self.text, self.image1, self.image2, self.image3]];
    
    self.contentView.lgb_Layout
    .alignToViewLeft(self, 0)
    .alignToViewTop(self, 0)
    .alignToViewRight(self, 0)
    .alignToViewArrayBottom(@[self.text, self.image1, self.image2, self.image3], 10);
    
    self.text.lgb_Layout
    .spaceToViewLeft(self.contentView, 10)
    .spaceToViewTop(self.contentView, 10)
    .spaceToViewRight(self.contentView, 10)
    .isHeight(0);
    
   
    self.image1.lgb_Layout
    .spaceToViewLeft(self.contentView, 10)
    .spaceToViewTop(self.text, 10)
    .isHeight(0);
    
    self.image2.lgb_Layout
    .spaceToViewLeft(self.image1, 10)
    .spaceToViewTop(self.text, 10)
    .isHeight(0);
    
    self.image3.lgb_Layout
    .spaceToViewLeft(self.image2, 10)
    .spaceToViewTop(self.text, 10)
    .spaceToViewRight(self.contentView, 10)
    .isHeight(0);
    
    [self.contentView lgb_setWidthEqualForSubviews:@[self.image1, self.image2, self.image3]];
    
}

-(UILabel *)text
{
    if (_text == nil) {
        _text = [UILabel new];
        _text.backgroundColor = [UIColor clearColor];
        _text.numberOfLines = 0;
    }
    return _text;
}

-(UIImageView *)image1
{
    if (_image1 == nil) {
        _image1 = [UIImageView new];
    }
    return _image1;
}

-(UIImageView *)image2
{
    if (_image2 == nil) {
        _image2 = [UIImageView new];
    }
    return _image2;
}

-(UIImageView *)image3
{
    if (_image3 == nil) {
        _image3 = [UIImageView new];
    }
    return _image3;
}

@end

@interface ExampleView10 () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation ExampleView10

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
    return [tableView lgb_getHeightOfCellClass:[self cellClassForIndexPath:indexPath] data:self.data[indexPath.row]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class c = [self cellClassForIndexPath:indexPath];
    UITableViewCell<ZATableViewCellDelegate> *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(c)];
    if (cell == nil) {
        cell = [[c alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(c)];
    }
    
    [cell lgb_configCellWithData:self.data[indexPath.row]];
    
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

-(Class)cellClassForIndexPath:(NSIndexPath *)indexPath
{
    ExampleModel10 *model = self.data[indexPath.row];
    if (model.imgs) {
        return [ExampleViewCell10_2 class];
    }
    
    return [ExampleViewCell10_1 class];
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
