//
//  ExampleView7.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/21.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "ExampleView7.h"
#import "ExampleModel7.h"

@interface ExampleViewCell7 : UITableViewCell <ZATableViewCellDelegate>
@property (nonatomic, strong) UIImageView *photo;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *text;
@property (nonatomic, strong) UIImageView *image;
@end

@implementation ExampleViewCell7

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
    ExampleModel7 *model = (ExampleModel7 *)data;
    
    self.photo.image = [UIImage imageNamed:model.photo];
    self.name.text = model.name;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 5;
    self.text.attributedText = [[NSAttributedString alloc] initWithString:model.text attributes:@{NSParagraphStyleAttributeName : style}];
    
    if (model.image) {
        UIImage *img = [UIImage imageNamed:model.image];
        self.image.image = img;
        
//        self.image.lgb_Layout
//        .heightEqualToWidth(img.size.height / img.size.width);
        
        self.contentView.lgb_Layout
        .alignToViewBottom(self.image, 10);
    }else{
        self.image.image = nil;
        
        self.contentView.lgb_Layout
        .alignToViewBottom(self.text, 10);
    }
}

-(void)setupViews
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView lgb_AddSubviews:@[self.photo, self.name, self.text, self.image]];
    
    self.contentView.lgb_Layout
    .alignToViewTop(self, 0)
    .alignToViewLeft(self, 0)
    .alignToViewRight(self, 0);
//    .alignToViewBottom(self.image, 10);
    
    self.photo.lgb_Layout
    .spaceToViewTop(self.contentView, 10)
    .spaceToViewLeft(self.contentView, 10)
    .isWidth(40)
    .heightEqualToWidth(1.0);
    
    self.name.lgb_Layout
    .alignToViewTop(self.photo, 0)
    .spaceToViewLeft(self.photo, 10)
    .spaceToViewRight(self.contentView, 10)
    .isHeight(0);
    
    self.text.lgb_Layout
    .spaceToViewTop(self.name, 10)
    .alignToViewLeft(self.name, 0)
    .spaceToViewRight(self.contentView, 10)
    .isHeight(0);
    
    self.image.lgb_Layout
    .spaceToViewTop(self.text, 10)
    .alignToViewLeft(self.text, 0)
    .widthRatioToView(self.contentView, 0.6)
    .isHeight(0);
}

-(UIImageView *)photo
{
    if (_photo == nil) {
        _photo = [UIImageView new];
    }
    return _photo;
}

-(UILabel *)name
{
    if (_name == nil) {
        _name = [UILabel new];
        _name.backgroundColor = [UIColor clearColor];
        _name.font = [UIFont systemFontOfSize:16.0];
        _name.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }
    return _name;
}

-(UILabel *)text
{
    if (_text == nil) {
        _text = [UILabel new];
        _text.backgroundColor = [UIColor clearColor];
        _text.font = [UIFont systemFontOfSize:16.0];
        _text.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _text.numberOfLines = 0;
    }
    return _text;
}

-(UIImageView *)image
{
    if (_image == nil) {
        _image = [UIImageView new];
    }
    return _image;
}

@end

@interface ExampleView7 () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation ExampleView7

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
    return [tableView lgb_getHeightOfCellClass:[ExampleViewCell7 class] data:self.data[indexPath.row]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExampleViewCell7 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell == nil) {
        cell = [[ExampleViewCell7 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
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
