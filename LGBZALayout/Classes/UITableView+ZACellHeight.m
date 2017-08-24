//
//  UITableView+ZACellHeight.m
//  Pods
//
//  Created by mac_256 on 2017/8/18.
//
//

#import "UITableView+ZACellHeight.h"
#import "UIView+ZALayout.h"
#import "UIView+ZAFlame.h"
#import <objc/runtime.h>

#define kOrientationKey       @"kOrientationKey"

@implementation UITableView (ZACellHeight)

-(void)lgb_removeHeightCache
{
    NSMutableDictionary *cache = [self lgb_cache];
    [cache removeAllObjects];
}

-(void)lgb_removeHeightCacheForData:(id)data
{
    NSMutableDictionary *cache = [self lgb_cache];
    [cache removeObjectForKey:[NSValue valueWithNonretainedObject:data]];
}

-(CGFloat)lgb_getHeightOfCellClass:(Class<ZATableViewCellDelegate>)cellClass data:(id)data
{
    NSMutableDictionary *cache = [self lgb_cache];
    
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    id objOrientation = [cache objectForKey:kOrientationKey];
    if (objOrientation) {
        if ([objOrientation integerValue] != orientation) {
            [cache removeAllObjects];
            [cache setObject:@(orientation) forKey:kOrientationKey];
        }
    }else{
        [cache setObject:@(orientation) forKey:kOrientationKey];
    }
    
    NSValue *key = [NSValue valueWithNonretainedObject:data];
    
    id obj = [cache objectForKey:key];
    if (obj) {
//        NSLog(@"cell cache height:%@,%@", obj, key);
        return [obj floatValue];
    }
    
    NSString *identifier = [NSString stringWithFormat:@"__identifier__%@", NSStringFromClass(cellClass)];
    UITableViewCell<ZATableViewCellDelegate> *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        [self registerClass:cellClass forCellReuseIdentifier:identifier];
        cell = [self dequeueReusableCellWithIdentifier:identifier];
    }
    
    [cell zaConfigCellWithData:data];
    
//    CH_log(@"cell width:%f", cell.width);
    
    cell.width = [self lgb_getWidth];
    CGFloat height = [self heightFromView:cell.contentView];
    
    [cache setObject:@(height) forKey:key];
    
//    NSLog(@"cell width 01:%f", cell.width);
//    NSLog(@"cal height:%f", height);
    
    return height;
}

-(NSMutableDictionary *)lgb_cache
{
    NSMutableDictionary *dic = objc_getAssociatedObject(self, _cmd);
    if (!dic) {
        dic = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, _cmd, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return dic;
}

@end
