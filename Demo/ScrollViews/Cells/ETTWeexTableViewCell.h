//
//  ETTWeexTableViewCell.h
//  Demo
//
//  Created by elliot on 2018/6/12.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETTWeexTableViewCell : UITableViewCell

@property (weak, nonatomic) UITableView *tableView;

- (void)setWeexURL:(NSURL *)weexURL viewController:(UIViewController *)vc;
+ (NSString *)cellReuseIdentifier;

@end
