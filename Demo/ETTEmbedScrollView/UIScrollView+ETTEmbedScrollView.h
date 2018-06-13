//
//  UIScrollView+ETTEmbedScrollView.h
//  Demo
//
//  Created by elliot on 2018/6/11.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ETTEmbedScrollViewType) {
    ETTEmbedScrollViewTypeMain,
    ETTEmbedScrollViewTypeEmbed
};

typedef NS_ENUM(NSInteger, ETTEmbedScrollViewDirection) {
    ETTEmbedScrollViewDirectionUp,
    ETTEmbedScrollViewDirectionDown
};

@interface UIScrollView (ETTEmbedScrollView)

@property (nonatomic) ETTEmbedScrollViewType ett_type;

/**
 In general,ett_top is equal to the embed scrollView.frame.origin.y,but for weex, you should
 obtain the weex containing cell`s frame.origin.y
 */
@property (nonatomic) float ett_top;
@property (weak, nonatomic) UIScrollView * _Nullable ett_embedScrollView;

- (void)ett_embedScrollView:(nonnull UIScrollView *)embedScrollView NS_UNAVAILABLE;
- (void)ett_unembedScrollView:(nonnull UIScrollView *)embedScrollView NS_UNAVAILABLE;
- (void)ett_mainScrollViewDidScrolled;

@end
