//
//  ETTImageTextTableViewCell.m
//  Demo
//
//  Created by elliot on 2018/6/12.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import "ETTImageTextTableViewCell.h"

@interface ETTImageTextTableViewCell ()
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIImageView *logoView;
@end


@implementation ETTImageTextTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont boldSystemFontOfSize:30];
    label.textColor = [UIColor orangeColor];
    label.numberOfLines = 0;
    [self.contentView addSubview:label];
    self.label = label;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = [UIImage imageNamed:@"logo"];
    [self.contentView addSubview:imageView];
    self.logoView = imageView;
}

- (void)layoutSubviews {
    [super layoutIfNeeded];
    self.logoView.frame = CGRectMake(10, 5, self.frame.size.height - 10, self.frame.size.height - 10);
    self.label.frame = CGRectMake(10 + self.logoView.frame.size.width + 30, 10, self.frame.size.width - 20, self.frame.size.height - 20);
}

- (void)setText:(NSString *)text {
    self.label.text = text;
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass(ETTImageTextTableViewCell.class);
}

@end
