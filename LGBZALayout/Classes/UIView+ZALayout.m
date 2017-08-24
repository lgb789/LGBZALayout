//
//  UIView+ZALayout.m
//  Pods
//
//  Created by mac_256 on 2017/8/17.
//
//

#import "UIView+ZALayout.h"
#import "UIView+ZAFlame.h"
#import <objc/runtime.h>

#define kNullFloat             (-1)

typedef ZALayoutManager* (^BViewSpaceRatio)(UIView *refView, CGFloat space, CGFloat ratio);

@interface ZALayoutItem : NSObject
@property (nonatomic, weak) UIView *refView;
@property (nonatomic, assign) CGFloat value;
@end

@implementation ZALayoutItem

@end

@interface ZALayoutItemViews : NSObject
@property (nonatomic, strong) NSArray *refViews;
@property (nonatomic, assign) CGFloat value;
@end

@implementation ZALayoutItemViews

@end

@interface ZALayoutItemSpace : NSObject
@property (nonatomic, weak) UIView *refView;
@property (nonatomic, assign) CGFloat ratio;
@property (nonatomic, assign) CGFloat space;
@end

@implementation ZALayoutItemSpace

@end

@interface ZALayoutManager ()

@property (nonatomic, weak) UIView *view;

@property (nonatomic, strong) ZALayoutItem *x;
@property (nonatomic, strong) ZALayoutItem *y;
@property (nonatomic, strong) ZALayoutItem *width;
@property (nonatomic, strong) ZALayoutItem *height;
@property (nonatomic, strong) ZALayoutItem *maxWidth;
@property (nonatomic, strong) ZALayoutItem *maxHeight;

@property (nonatomic, strong) ZALayoutItem *leftSpace;
@property (nonatomic, strong) ZALayoutItem *rightSpace;
@property (nonatomic, strong) ZALayoutItem *topSpace;
@property (nonatomic, strong) ZALayoutItem *bottomSpace;

@property (nonatomic, strong) ZALayoutItem *alignLeft;
@property (nonatomic, strong) ZALayoutItem *alignRight;
@property (nonatomic, strong) ZALayoutItem *alignTop;
@property (nonatomic, strong) ZALayoutItem *alignBottom;

@property (nonatomic, strong) ZALayoutItem *centerX;
@property (nonatomic, strong) ZALayoutItem *centerY;
@property (nonatomic, strong) ZALayoutItem *center;

@property (nonatomic, strong) ZALayoutItem *widthRatio;
@property (nonatomic, strong) ZALayoutItem *heightRatio;
@property (nonatomic, strong) ZALayoutItem *widthToHeight;
@property (nonatomic, strong) ZALayoutItem *heightToWidth;

@property (nonatomic, strong) ZALayoutItem *contentAlignBottom;
@property (nonatomic, strong) ZALayoutItem *contentAlignRight;

@property (nonatomic, strong) ZALayoutItemViews *alignArrayBottom;

@property (nonatomic, copy) BViewSpaceRatio subviewWidthEqualToView;

@property (nonatomic, strong) ZALayoutItemSpace *subviewsWidthEqual;
@end

@implementation ZALayoutManager

-(void)updateLayout
{
    [self.view.superview setNeedsLayout];
    [self.view.superview layoutIfNeeded];
}

-(BViewValue)createBViewValueWithKey:(NSString *)key
{
    __weak typeof(self) weakSelf = self;
    return ^(UIView *refView, CGFloat value){
        
        ZALayoutItem *item = [ZALayoutItem new];
        item.refView = refView;
        item.value = value;
        
        [weakSelf setValue:item forKey:key];
        return weakSelf;
    };
}

-(BValue)createBValueWithKey:(NSString *)key
{
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value){
        ZALayoutItem *item = [ZALayoutItem new];
        item.value = value;
        
        [weakSelf setValue:item forKey:key];
        return weakSelf;
    };
}

-(BView)createBViewWithKey:(NSString *)key
{
    __weak typeof(self) weakSelf = self;
    return ^(UIView *refView){
        ZALayoutItem *item = [ZALayoutItem new];
        item.refView = refView;
        [weakSelf setValue:item forKey:key];
        return weakSelf;
    };
}

-(BViewArrayValue)createBViewArrayValueWithKey:(NSString *)key
{
    __weak typeof(self) weakSelf = self;
    
    return ^(NSArray *viewArray, CGFloat value){
        ZALayoutItemViews *item = [ZALayoutItemViews new];
        item.value = value;
        item.refViews = viewArray;
        [weakSelf setValue:item forKey:key];
        return weakSelf;
    };
}

-(BViewSpaceRatio)createBViewSpaceRatioWithKey:(NSString *)key
{
    __weak typeof(self) weakSelf = self;
    
    return ^(UIView *refView, CGFloat space, CGFloat ratio){
        ZALayoutItemSpace *item = [ZALayoutItemSpace new];
        item.refView = refView;
        item.ratio = ratio;
        item.space = space;
        [weakSelf setValue:item forKey:key];
        return weakSelf;
    };
}


-(BViewValue)spaceToViewLeft
{
    if (_spaceToViewLeft == nil) {
        _spaceToViewLeft = [self createBViewValueWithKey:NSStringFromSelector(@selector(leftSpace))];
    }
    return _spaceToViewLeft;
}

-(BViewValue)spaceToViewRight
{
    if (_spaceToViewRight == nil) {
        _spaceToViewRight = [self createBViewValueWithKey:NSStringFromSelector(@selector(rightSpace))];
    }
    return _spaceToViewRight;
}

-(BViewValue)spaceToViewTop
{
    if (_spaceToViewTop == nil) {
        _spaceToViewTop = [self createBViewValueWithKey:NSStringFromSelector(@selector(topSpace))];
    }
    return _spaceToViewTop;
}

-(BViewValue)spaceToViewBottom
{
    if (_spaceToViewBottom == nil) {
        _spaceToViewBottom = [self createBViewValueWithKey:NSStringFromSelector(@selector(bottomSpace))];
    }
    return _spaceToViewBottom;
}

-(BViewValue)alignToViewLeft
{
    if (_alignToViewLeft == nil) {
        _alignToViewLeft = [self createBViewValueWithKey:NSStringFromSelector(@selector(alignLeft))];
    }
    return _alignToViewLeft;
}

-(BViewValue)alignToViewRight
{
    if (_alignToViewRight == nil) {
        _alignToViewRight = [self createBViewValueWithKey:NSStringFromSelector(@selector(alignRight))];
    }
    return _alignToViewRight;
}

-(BViewValue)alignToViewTop
{
    if (_alignToViewTop == nil) {
        _alignToViewTop = [self createBViewValueWithKey:NSStringFromSelector(@selector(alignTop))];
    }
    return _alignToViewTop;
}

-(BViewValue)alignToViewBottom
{
    if (_alignToViewBottom == nil) {
        _alignToViewBottom = [self createBViewValueWithKey:NSStringFromSelector(@selector(alignBottom))];
    }
    return _alignToViewBottom;
}

-(BValue)isX
{
    if (_isX == nil) {
        _isX = [self createBValueWithKey:NSStringFromSelector(@selector(x))];
    }
    return _isX;
}

-(BValue)isY
{
    if (_isY == nil) {
        _isY = [self createBValueWithKey:NSStringFromSelector(@selector(y))];
    }
    return _isY;
}

-(BValue)isWidth
{
    if (_isWidth == nil) {
        _isWidth = [self createBValueWithKey:NSStringFromSelector(@selector(width))];
    }
    return _isWidth;
}

-(BValue)isHeight
{
    if (_isHeight == nil) {
        _isHeight = [self createBValueWithKey:NSStringFromSelector(@selector(height))];
    }
    return _isHeight;
}

-(BValue)isMaxWidth
{
    if (_isMaxWidth == nil) {
        _isMaxWidth = [self createBValueWithKey:NSStringFromSelector(@selector(maxWidth))];
    }
    return _isMaxWidth;
}

-(BValue)isMaxHeight
{
    if (_isMaxHeight == nil) {
        _isMaxHeight = [self createBValueWithKey:NSStringFromSelector(@selector(maxHeight))];
    }
    return _isMaxHeight;
}

-(BViewValue)centerEqualToViewX
{
    if (_centerEqualToViewX == nil) {
        _centerEqualToViewX = [self createBViewValueWithKey:NSStringFromSelector(@selector(centerX))];
    }
    return _centerEqualToViewX;
}

-(BViewValue)centerEqualToViewY
{
    if (_centerEqualToViewY == nil) {
        _centerEqualToViewY = [self createBViewValueWithKey:NSStringFromSelector(@selector(centerY))];
    }
    return _centerEqualToViewY;
}

-(BView)centerEqualToView
{
    if (_centerEqualToView == nil) {
        _centerEqualToView = [self createBViewWithKey:NSStringFromSelector(@selector(center))];
    }
    return _centerEqualToView;
}

-(BViewValue)widthRatioToView
{
    if (_widthRatioToView == nil) {
        _widthRatioToView = [self createBViewValueWithKey:NSStringFromSelector(@selector(widthRatio))];
    }
    return _widthRatioToView;
}

-(BViewValue)heightRatioToView
{
    if (_heightRatioToView == nil) {
        _heightRatioToView = [self createBViewValueWithKey:NSStringFromSelector(@selector(heightRatio))];
    }
    return _heightRatioToView;
}

-(BValue)widthEqualToHeight
{
    if (_widthEqualToHeight == nil) {
        _widthEqualToHeight = [self createBValueWithKey:NSStringFromSelector(@selector(widthToHeight))];
    }
    return _widthEqualToHeight;
}

-(BValue)heightEqualToWidth
{
    if (_heightEqualToWidth == nil) {
        _heightEqualToWidth = [self createBValueWithKey:NSStringFromSelector(@selector(heightToWidth))];
    }
    return _heightEqualToWidth;
}

-(BViewValue)contentAlignToViewBottom
{
    if (_contentAlignToViewBottom == nil) {
        _contentAlignToViewBottom = [self createBViewValueWithKey:NSStringFromSelector(@selector(contentAlignBottom))];
    }
    return _contentAlignToViewBottom;
}

-(BViewValue)contentAlignToViewRight
{
    if (_contentAlignToViewRight == nil) {
        _contentAlignToViewRight = [self createBViewValueWithKey:NSStringFromSelector(@selector(contentAlignRight))];
    }
    return _contentAlignToViewRight;
}

-(BViewArrayValue)alignToViewArrayBottom
{
    if (_alignToViewArrayBottom == nil) {
        _alignToViewArrayBottom = [self createBViewArrayValueWithKey:NSStringFromSelector(@selector(alignArrayBottom))];
    }
    return _alignToViewArrayBottom;
}

-(BViewSpaceRatio)subviewWidthEqualToView
{
    if (_subviewWidthEqualToView == nil) {
        _subviewWidthEqualToView = [self createBViewSpaceRatioWithKey:NSStringFromSelector(@selector(subviewsWidthEqual))];
    }
    return _subviewWidthEqualToView;
}

@end

@implementation UIView (ZALayout)

-(void)lgb_AddSubviews:(NSArray *)subviews
{
    if (!subviews || subviews.count == 0) {
        return;
    }
    
    for (UIView *v in subviews) {
        [self addSubview:v];
    }
}

-(CGFloat)lgb_getHeight
{
    ZALayoutManager *manager = [self lgb_layoutManager];
    if (!manager) {
        return self.height;
    }
    
    return [self heightFromManager:manager];
}

-(CGFloat)lgb_getWidth
{
    ZALayoutManager *manager = [self lgb_layoutManager];
    if (!manager) {
        return self.width;
    }
    
    return [self widthFromManager:manager];
}

-(void)lgb_setWidthEqualForSubviews:(NSArray *)subviews
{
    if (!subviews || subviews.count == 0) {
        return;
    }
    
    CGFloat space = 0;
    
    for (UIView *v in subviews) {
        ZALayoutManager *manager = [v lgb_layoutManager];
        if (!manager) {
            continue;
        }
        
        if (manager.leftSpace) {
            space += manager.leftSpace.value;
        }
        if (manager.rightSpace) {
            space += manager.rightSpace.value;
        }
    }
    
    for (UIView *v in subviews) {
        v.lgb_Layout.subviewWidthEqualToView(self, space, 1.0 / subviews.count);
    }
}

-(CGFloat)calculateWidthOfView:(UIView *)view
{
    CGFloat width = kNullFloat;
    if ([view isKindOfClass:[UILabel class]]) {
        CGSize size = [view sizeThatFits:CGSizeMake(CGFLOAT_MAX, [self heightFromView:view])];
        width = size.width;
    }else if ([view isKindOfClass:[UIImageView class]]){
        UIImage *img = ((UIImageView *)view).image;
        if (img) {
            width = img.size.width / img.size.height * [self heightFromView:view];
        }
    }
    
    return width;
}

-(CGFloat)calculateHeightOfView:(UIView *)view
{
    CGFloat height = kNullFloat;
    if ([view isKindOfClass:[UILabel class]]) {
        CGSize size = [view sizeThatFits:CGSizeMake([self widthFromView:view], CGFLOAT_MAX)];
        
        height = size.height;
    }else if ([view isKindOfClass:[UIImageView class]]){
        UIImage *img = ((UIImageView *)view).image;
        if (img) {
            height = img.size.height / img.size.width * [self widthFromView:view];
        }
    }
    
    return height;
}


-(CGPoint)convertOrigin:(CGPoint)origin fromView:(UIView *)fromView toView:(UIView *)toView
{
    UIView *superView = toView.superview ? toView.superview : toView;
    UIView *topSuperView = fromView.topSuperView;
//    NSLog(@"top super view:%@", topSuperView);
    CGPoint p = [superView convertPoint:origin toView:topSuperView];
    p = [topSuperView convertPoint:p toView:fromView.superview];
    
    return p;
}

//Height
-(CGFloat)heightFromView:(UIView *)fromView
{
    ZALayoutManager *manager = [fromView lgb_layoutManager];
    if (!manager) {
        return fromView.height;
    }

    return [self heightFromManager:manager];
}

-(CGFloat)heightFromAlignBottomOffset:(CGFloat)offset fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        
        return [self heightFromView:toView] - [self yFromView:fromView] + offset;
    }else if (fromView == toView.superview){
        
        return [self yFromView:toView] + [self heightFromView:toView] + offset;
    }
    
    CGPoint origin = [self convertOrigin:CGPointMake(0, [self yFromView:toView]) fromView:fromView toView:toView];
    
    CGFloat toviewheight = [self heightFromView:toView];
    CGFloat fromviewY = [self yFromView:fromView];
//    NSLog(@"origin from y:%f, %f, %f", origin.y, fromviewY, toviewheight);
//    NSLog(@"from view:%@", fromView);
//    NSLog(@"to view:%@", toView);
    CGFloat heigh = origin.y + toviewheight - fromviewY + offset;
//    NSLog(@"heithg:%f", heigh);
    return heigh;
}

-(CGFloat)heightFromBottomSpace:(CGFloat)space fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        return [self heightFromView:toView] - space - [self yFromView:fromView];
    }
    
    CGPoint origin = [self convertOrigin:CGPointMake(0, [self yFromView:toView]) fromView:fromView toView:toView];

    return origin.y - space - [self yFromView:fromView];
}

//Width
-(CGFloat)widthFromView:(UIView *)fromView
{
    ZALayoutManager *manager = [fromView lgb_layoutManager];
    if (!manager) {
        return fromView.width;
    }
    
    return [self widthFromManager:manager];
}

-(CGFloat)widthFromSpace:(CGFloat)space ratio:(CGFloat)ratio fromView:(UIView *)fromView toView:(UIView *)toView
{
    CGFloat width = [self widthFromView:toView];
    return (width - space) * ratio;
}

-(CGFloat)widthFromAlignRightOffset:(CGFloat)offset fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        return [self widthFromView:toView] - [self xFromView:fromView] + offset;
    }else if (fromView == toView.superview){
        return [self xFromView:toView] + [self widthFromView:toView] + offset;
    }
    
    CGPoint origin = [self convertOrigin:CGPointMake([self xFromView:toView], 0) fromView:fromView toView:toView];
    
    return origin.x + [self widthFromView:toView] - [self xFromView:fromView] + offset;
}

-(CGFloat)widthFromRightSpace:(CGFloat)space fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        return [self widthFromView:toView] - [self xFromView:fromView] - space;
    }

    CGPoint origin = [self convertOrigin:CGPointMake([self xFromView:toView], 0) fromView:fromView toView:toView];
    
    return origin.x - [self xFromView:fromView] - space;
}

//Y
-(CGFloat)yFromView:(UIView *)fromView
{
    ZALayoutManager *manager = [fromView lgb_layoutManager];
    if (!manager) {
        return fromView.y;
    }
    
    return [self yFromManager:manager];
}

-(CGFloat)yFromCenterYOffset:(CGFloat)offset fromView:(UIView *)fromView toView:(UIView *)toView
{
    CGPoint origin = [self convertOrigin:CGPointMake(0, [self yFromView:toView]) fromView:fromView toView:toView];
    
    return origin.y + [self heightFromView:toView] / 2 - [self heightFromView:fromView] / 2 + offset;
}

-(CGFloat)yFromAlignBottomOffset:(CGFloat)offset fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        return [self heightFromView:toView] - [self heightFromView:fromView] - offset;
    }
    
    CGPoint origin = [self convertOrigin:CGPointMake(0, [self yFromView:toView]) fromView:fromView toView:toView];
    
    return origin.y + [self heightFromView:toView] - [self heightFromView:fromView] - offset;
}

-(CGFloat)yFromBottomSpace:(CGFloat)space fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        return [self heightFromView:toView] - [self heightFromView:fromView] - space;
    }
    
    CGPoint origin = [self convertOrigin:CGPointMake(0, [self yFromView:toView]) fromView:fromView toView:toView];
    
    return origin.y - space - [self heightFromView:fromView];
}

-(CGFloat)yFromAlignTopOffset:(CGFloat)offset fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        return offset;
    }
    
    CGPoint origin = [self convertOrigin:CGPointMake(0, [self yFromView:toView]) fromView:fromView toView:toView];
    return origin.y + offset;
}

-(CGFloat)yFromTopSpace:(CGFloat)space fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        return space;
    }
    
    CGPoint origin = [self convertOrigin:CGPointMake(0, [self yFromView:toView]) fromView:fromView toView:toView];

    return origin.y + [self heightFromView:toView] + space;
}

//X
-(CGFloat)xFromView:(UIView *)fromView
{
    ZALayoutManager *manager = [fromView lgb_layoutManager];
    if (!manager) {
        return fromView.x;
    }
    
    return [self xFromManager:manager];
}

-(CGFloat)xFromCenterXOffset:(CGFloat)offset fromView:(UIView *)fromView toView:(UIView *)toView
{
    CGPoint origin = [self convertOrigin:CGPointMake([self xFromView:toView], 0) fromView:fromView toView:toView];
    
    return origin.x + [self widthFromView:toView] / 2 - [self widthFromView:fromView] / 2 + offset;
}

-(CGFloat)xFromAlignLeftOffset:(CGFloat)offset fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        return offset;
    }
    
    CGPoint origin = [self convertOrigin:CGPointMake([self xFromView:toView], 0) fromView:fromView toView:toView];
    
    return origin.x + offset;
}

-(CGFloat)xFromAlignRightOffset:(CGFloat)offset fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        return [self widthFromView:toView] - [self widthFromView:fromView] - offset;
    }
    
    CGPoint origin = [self convertOrigin:CGPointMake([self xFromView:toView], 0) fromView:fromView toView:toView];
    
    return origin.x + [self widthFromView:toView] - [self widthFromView:fromView] - offset;
}

-(CGFloat)xFromRightSpace:(CGFloat)space fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        return [self widthFromView:toView] - [self widthFromView:fromView] - space;
    }
    
    CGPoint origin = [self convertOrigin:CGPointMake([self xFromView:toView], 0) fromView:fromView toView:toView];
    
    return origin.x - space - [self widthFromView:fromView];
}

-(CGFloat)xFromLeftSpace:(CGFloat)space fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (fromView.superview == toView) {
        return space;
    }
    
    CGPoint origin = [self convertOrigin:CGPointMake([self xFromView:toView], 0) fromView:fromView toView:toView];
    
    return origin.x + [self widthFromView:toView] + space;
}

//frame
-(CGFloat)heightFromManager:(ZALayoutManager *)manager
{

    if (manager.height) {
//        NSLog(@"height to height");
        if (manager.height.value == 0) {
            CGFloat height = [self calculateHeightOfView:manager.view];

            if (height != kNullFloat) {
                return height;
            }
        }
        
        return manager.height.value;
        
    }else if (manager.maxHeight){
//        NSLog(@"height to maxHeight");
        CGFloat height = [self calculateHeightOfView:manager.view];
        if (height != kNullFloat) {
            return height > manager.maxHeight.value ? manager.maxHeight.value : height;
        }

        return manager.maxHeight.value;
        
    }else if (manager.bottomSpace) {
//        NSLog(@"height to bottomSpace");
        return [self heightFromBottomSpace:manager.bottomSpace.value fromView:manager.view toView:manager.bottomSpace.refView];
    }else if (manager.alignBottom){
//        NSLog(@"height to alignBottom");
        return [self heightFromAlignBottomOffset:manager.alignBottom.value fromView:manager.view toView:manager.alignBottom.refView];
    }else if (manager.heightRatio){
//        NSLog(@"height to heightRatio");
        return [self heightFromView:manager.heightRatio.refView] * manager.heightRatio.value;
    }else if (manager.heightToWidth){
//        NSLog(@"height to width");
        return [self widthFromView:manager.view] * manager.heightToWidth.value;
    }else if (manager.alignArrayBottom){
        CGFloat height = 0;
//        NSLog(@"refview count:%ld", manager.alignArrayBottom.refViews.count);
        for (UIView *refView in manager.alignArrayBottom.refViews) {
            height = MAX(height, [self heightFromAlignBottomOffset:manager.alignArrayBottom.value fromView:manager.view toView:refView]);
//            NSLog(@"max height:%f", height);
        }
        return height;
    }
    
    return 0;
}

-(CGFloat)widthFromManager:(ZALayoutManager *)manager
{
    if (manager.width) {
        
        if (manager.width.value == 0) {
            CGFloat width = [self calculateWidthOfView:manager.view];
            if (width != kNullFloat) {
                return width;
            }
        }
        return manager.width.value;
        
    }else if (manager.maxWidth){
        
        CGFloat width = [self calculateWidthOfView:manager.view];

        if (width != kNullFloat) {
            return width > manager.maxWidth.value ? manager.maxWidth.value : width;
        }
        
        return manager.maxWidth.value;
        
    }else if (manager.rightSpace) {
        return [self widthFromRightSpace:manager.rightSpace.value fromView:manager.view toView:manager.rightSpace.refView];
    }else if (manager.alignRight){
        return [self widthFromAlignRightOffset:manager.alignRight.value fromView:manager.view toView:manager.alignRight.refView];
    }else if (manager.widthRatio){
        return [self widthFromView:manager.widthRatio.refView] * manager.widthRatio.value;
    }else if (manager.widthToHeight){
        return [self heightFromView:manager.view] * manager.widthToHeight.value;
    }else if (manager.subviewsWidthEqual){
        return [self widthFromSpace:manager.subviewsWidthEqual.space ratio:manager.subviewsWidthEqual.ratio fromView:manager.view toView:manager.subviewsWidthEqual.refView];
    }
    return 0;
}

-(CGFloat)yFromManager:(ZALayoutManager *)manager
{
    if (manager.y) {
        return manager.y.value;
    }else if (manager.topSpace) {
        return [self yFromTopSpace:manager.topSpace.value fromView:manager.view toView:manager.topSpace.refView];
    }else if (manager.alignTop){
        return [self yFromAlignTopOffset:manager.alignTop.value fromView:manager.view toView:manager.alignTop.refView];
    }else if (manager.bottomSpace){
        return [self yFromBottomSpace:manager.bottomSpace.value fromView:manager.view toView:manager.bottomSpace.refView];
    }else if (manager.alignBottom){
        return [self yFromAlignBottomOffset:manager.alignBottom.value fromView:manager.view toView:manager.alignBottom.refView];
    }else if (manager.centerY){
        return [self yFromCenterYOffset:manager.centerY.value fromView:manager.view toView:manager.centerY.refView];
    }else if (manager.center){
        return [self yFromCenterYOffset:0 fromView:manager.view toView:manager.center.refView];
    }
    return 0;
}

-(CGFloat)xFromManager:(ZALayoutManager *)manager
{
    if (manager.x) {
        return manager.x.value;
    }else if (manager.leftSpace) {
        return [self xFromLeftSpace:manager.leftSpace.value fromView:manager.view toView:manager.leftSpace.refView];
    }else if (manager.alignLeft){
        return [self xFromAlignLeftOffset:manager.alignLeft.value fromView:manager.view toView:manager.alignLeft.refView];
    }else if (manager.rightSpace){
        return [self xFromRightSpace:manager.rightSpace.value fromView:manager.view toView:manager.rightSpace.refView];
    }else if (manager.alignRight){
        return [self xFromAlignRightOffset:manager.alignRight.value fromView:manager.view toView:manager.alignRight.refView];
    }else if (manager.centerX){
        return [self xFromCenterXOffset:manager.centerX.value fromView:manager.view toView:manager.centerX.refView];
    }else if (manager.center){
        return [self xFromCenterXOffset:0 fromView:manager.view toView:manager.center.refView];
    }
    return 0;
}

-(void)setFrameFromLayoutManager:(ZALayoutManager *)manager
{
    self.x = [self xFromManager:manager];
    self.y = [self yFromManager:manager];
    self.width = [self widthFromManager:manager];
    self.height = [self heightFromManager:manager];
    
}

-(void)setScrollContentSizeFromLayoutManager:(ZALayoutManager *)manager
{
    if (![self isKindOfClass:[UIScrollView class]]) {
        return;
    }
    
    UIScrollView *scroll = (UIScrollView *)self;
    
    if (manager.contentAlignBottom) {
        CGFloat height = [self heightFromAlignBottomOffset:manager.contentAlignBottom.value fromView:manager.view toView:manager.contentAlignBottom.refView] - scroll.contentInset.top - scroll.contentInset.bottom;
        scroll.contentSize = CGSizeMake([self widthFromView:scroll], height);
    }else if (manager.contentAlignRight){
        CGFloat width = [self widthFromAlignRightOffset:manager.contentAlignRight.value fromView:manager.view toView:manager.contentAlignRight.refView] - scroll.contentInset.left - scroll.contentInset.right;
        scroll.contentSize = CGSizeMake(width, [self heightFromView:scroll]);
    }
}

-(ZALayoutManager *)lgb_Layout
{
    ZALayoutManager *obj = [self lgb_layoutManager];
    if (!obj) {
        obj = [ZALayoutManager new];
        obj.view = self;
        [self set_LayoutManager:obj];
    }
    return obj;
}

-(ZALayoutManager *)lgb_layoutManager
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)set_LayoutManager:(ZALayoutManager *)layoutManager
{
    objc_setAssociatedObject(self, @selector(lgb_layoutManager), layoutManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)lgb_layoutSubviews
{
    [self lgb_layoutSubviews];
    
    [[self subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ZALayoutManager *manager = [obj lgb_layoutManager];
        if (manager) {
            [obj setFrameFromLayoutManager:manager];
            [obj setScrollContentSizeFromLayoutManager:manager];
        }
    }];
}

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oldMethod = class_getInstanceMethod(self, NSSelectorFromString(@"layoutSubviews"));
        Method newMethod = class_getInstanceMethod(self, NSSelectorFromString(@"lgb_layoutSubviews"));
        method_exchangeImplementations(oldMethod, newMethod);
    });
}

@end
