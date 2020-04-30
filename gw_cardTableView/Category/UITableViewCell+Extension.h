//
//  UITableViewCell+Extension.h
//  gw_cardTableView
//
//  Created by 刘功武 on 2020/4/30.
//  Copyright © 2020 _Coder. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (Extension)


- (void)addSectionCornerWithTableView:(UITableView *)tableView tableViewCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath cornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
