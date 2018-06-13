//
//  UIScrollView+ETTEmbedScrollView.m
//  Demo
//
//  Created by elliot on 2018/6/11.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import "UIScrollView+ETTEmbedScrollView.h"
#import <objc/runtime.h>
#import "NSNumber+ETTFloatComparor.h"

@interface UIScrollView ()

@property (strong, nonatomic) NSMutableArray *ett_embedScrollViews;

@end

@implementation UIScrollView (ETTEmbedScrollView)

- (void)ett_embedScrollView:(nonnull UIScrollView *)embedScrollView {
    if (!self.ett_embedScrollViews) {
        self.ett_embedScrollViews = [NSMutableArray new];
    }
    if ([self.ett_embedScrollViews containsObject:embedScrollView]) {
        return;
    }
    embedScrollView.ett_type = ETTEmbedScrollViewTypeEmbed;
    [self.ett_embedScrollViews addObject:embedScrollView];
}

- (void)ett_unembedScrollView:(nonnull UIScrollView *)embedScrollView {
    if ([self.ett_embedScrollViews containsObject:embedScrollView]) {
        embedScrollView.scrollEnabled = YES;
        [self.ett_embedScrollViews removeObject:embedScrollView];
    }
}

- (void)ett_mainScrollViewDidScrolled {
    if (!self.ett_embedScrollView) {
        return;
    }
    if (self.ett_type != ETTEmbedScrollViewTypeMain) {
        return;
    }
    UIScrollView *scrollViewShouldScroll = [self ett_scrollViewShouldBeTriggered];
        CGFloat offsetY = self.contentOffset.y;
    if (scrollViewShouldScroll != self) {
        CGPoint offset = scrollViewShouldScroll.contentOffset;
        offset.y += offsetY - scrollViewShouldScroll.ett_top;
        offset.y = MIN(offset.y, scrollViewShouldScroll.contentSize.height - scrollViewShouldScroll.bounds.size.height);
        offset.y = MAX(offset.y, 0);
        scrollViewShouldScroll.contentOffset = offset;
        self.contentOffset = CGPointMake(0, scrollViewShouldScroll.ett_top);
    }
}

- (UIScrollView *)ett_scrollViewShouldBeTriggered {
    // If the content height is less than one screen,always scroll the main scrollView
    if ([@(self.ett_embedScrollView.contentSize.height) ett_isLessThanFloatNumber:@(self.ett_embedScrollView.bounds.size.height)]) {
        return self;
    }
    if ([@(self.contentOffset.y) ett_isGreaterOrEqualToFloatNumber:@(self.ett_embedScrollView.ett_top)] && [@(self.ett_embedScrollView.contentOffset.y) ett_isGreaterOrEqualToFloatNumber:@0] && [@(self.ett_embedScrollView.contentOffset.y) ett_isLessOrEqualToFloatNumber:@(self.ett_embedScrollView.contentSize.height - self.ett_embedScrollView.bounds.size.height)]) {
        if ([self ett_embedScrollViewDidScrollToBottom:self.ett_embedScrollView]) {
            if ([self ett_scrollDirection] == ETTEmbedScrollViewDirectionUp) {
                return self;
            }
            if ([@(self.contentOffset.y) ett_isGreaterThanFloatNumber:@(self.ett_embedScrollView.ett_top)] && [self ett_scrollDirection] == ETTEmbedScrollViewDirectionDown) {
                return self;
            }
        }
        return self.ett_embedScrollView;
    } else {
        if ([@(self.ett_embedScrollView.contentOffset.y) ett_isGreaterThanFloatNumber:@0] && [self ett_scrollDirection] == ETTEmbedScrollViewDirectionDown) {
            return self.ett_embedScrollView;
        }
        return self;
    }
//    for (UIScrollView *embedScrollView in self.ett_embedScrollViews) {
//        if ([@(self.contentOffset.y) ett_isGreaterOrEqualToFloatNumber:@(embedScrollView.ett_top)] && [@(embedScrollView.contentOffset.y) ett_isGreaterOrEqualToFloatNumber:@0] && [@(embedScrollView.contentOffset.y) ett_isLessOrEqualToFloatNumber:@(embedScrollView.contentSize.height - embedScrollView.bounds.size.height)]) {
//            if ([self ett_embedScrollViewDidScrollToBottom:embedScrollView]) {
//                if ([self ett_scrollDirection] == ETTEmbedScrollViewDirectionUp) {
//                    return self;
//                }
//                if ([@(self.contentOffset.y) ett_isGreaterThanFloatNumber:@(embedScrollView.ett_top)] && [self ett_scrollDirection] == ETTEmbedScrollViewDirectionDown) {
//                    return self;
//                }
//            }
//            return embedScrollView;
//        } else {
//            if ([@(embedScrollView.contentOffset.y) ett_isGreaterThanFloatNumber:@0] && [self ett_scrollDirection] == ETTEmbedScrollViewDirectionDown) {
//                return embedScrollView;
//            }
//            return self;
//        }
//    }
//    return self;
}

- (ETTEmbedScrollViewDirection)ett_scrollDirection {
    ETTEmbedScrollViewDirection scrollDirection = ETTEmbedScrollViewDirectionUp;
    CGPoint point =  [self.panGestureRecognizer translationInView:self.superview];
    if (point.y > 0) {
        scrollDirection = ETTEmbedScrollViewDirectionDown;
    }
    return scrollDirection;
}

- (BOOL)ett_embedScrollViewDidScrollToBottom:(UIScrollView *)embededScrollView {
    return [@(embededScrollView.contentOffset.y) ett_isEqualToFloatNumber:@(embededScrollView.contentSize.height - embededScrollView.bounds.size.height)];
}

#pragma mark - Getter/Setter

- (void)setEtt_embedScrollViews:(NSMutableArray *)ett_embedScrollViews {
    objc_setAssociatedObject(self, @selector(ett_embedScrollViews), ett_embedScrollViews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)ett_embedScrollViews {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setEtt_embedScrollView:(UIScrollView *)ett_embedScrollView {
    ett_embedScrollView.scrollEnabled = NO;
    objc_setAssociatedObject(self, @selector(ett_embedScrollView), ett_embedScrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIScrollView *)ett_embedScrollView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setEtt_top:(float)ett_top {
    objc_setAssociatedObject(self, @selector(ett_top), @(ett_top), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (float)ett_top {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setEtt_type:(ETTEmbedScrollViewType)ett_type {
    objc_setAssociatedObject(self, @selector(ett_type), @(ett_type), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ETTEmbedScrollViewType)ett_type {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

@end
