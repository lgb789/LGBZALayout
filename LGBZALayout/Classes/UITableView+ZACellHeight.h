//
//  UITableView+ZACellHeight.h
//  Pods
//
//  Created by mac_256 on 2017/8/18.
//
//

#import <UIKit/UIKit.h>

@protocol ZATableViewCellDelegate <NSObject>

-(void)zaConfigCellWithData:(id)data;

@end

@interface UITableView (ZACellHeight)

-(void)lgb_removeHeightCache;

-(void)lgb_removeHeightCacheForData:(id)data;

-(CGFloat)lgb_getHeightOfCellClass:(Class<ZATableViewCellDelegate>)cellClass data:(id)data;

@end
