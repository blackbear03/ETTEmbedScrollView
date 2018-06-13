//
//  ETTTextTableViewCell.m
//  Demo
//
//  Created by elliot on 2018/6/12.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import "ETTTextTableViewCell.h"

@interface ETTTextTableViewCell ()
@property (strong, nonatomic) UILabel *label;
@end

@implementation ETTTextTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor darkTextColor];
    label.numberOfLines = 0;
    [self.contentView addSubview:label];
    self.label = label;
}

- (void)layoutSubviews {
    [super layoutIfNeeded];
    self.label.frame = CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 20);
}

- (void)setText:(NSString *)text {
    self.label.text = text;
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass(ETTTextTableViewCell.class);
}

@end
