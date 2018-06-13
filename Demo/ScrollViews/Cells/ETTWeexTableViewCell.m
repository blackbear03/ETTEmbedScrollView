//
//  ETTWeexTableViewCell.m
//  Demo
//
//  Created by elliot on 2018/6/12.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import "ETTWeexTableViewCell.h"
#import "ETTWeexContainerView.h"
#import "UIScrollView+ETTEmbedScrollView.h"

@interface ETTWeexTableViewCell ()
@property (strong, nonatomic) ETTWeexContainerView *weexView;
@property (weak, nonatomic) UIScrollView *wxTableView;
@end

@implementation ETTWeexTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    ETTWeexContainerView *weexView = [[ETTWeexContainerView alloc] initWithFrame:CGRectZero];
    __weak typeof(&*self) wSelf = self;
    weexView.renderFinished = ^(UIScrollView *scrollView) {
        __strong typeof(&*self) sSelf = wSelf;
        scrollView.ett_top = sSelf.frame.origin.y;
        sSelf.wxTableView = scrollView;
        sSelf.tableView.ett_embedScrollView = scrollView;
    };
    [self.contentView addSubview:weexView];
    self.weexView = weexView;
}

- (void)layoutSubviews {
    [super layoutIfNeeded];
    self.weexView.frame = self.bounds;
}

- (void)setWeexURL:(NSURL *)weexURL viewController:(UIViewController *)vc {
    [self.weexView setViewController:vc];
    [self.weexView setWeexURL:weexURL];
    self.tableView.ett_embedScrollView = self.wxTableView;
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass(ETTWeexTableViewCell.class);
}

@end
