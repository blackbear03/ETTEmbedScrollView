//
//  ETTTextTableViewCell.h
//  Demo
//
//  Created by elliot on 2018/6/12.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETTTextTableViewCell : UITableViewCell

- (void)setText:(NSString *)text;
+ (NSString *)cellReuseIdentifier;

@end
