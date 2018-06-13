//
//  ETTWeexContainerView.m
//  Demo
//
//  Created by elliot on 2018/5/10.
//  Copyright © 2018年 elliot All rights reserved.
//

#import "ETTWeexContainerView.h"
#import <WeexSDK/WeexSDK.h>

/// Empty string check
#define ETT_IS_EMPTY(str) (![str isKindOfClass:[NSString class]] || str.length == 0)

@interface ETTWeexContainerView()

@property (strong, nonatomic) WXSDKInstance *weexInstance;
@property (strong, nonatomic) UIView *weexView;

@end

@implementation ETTWeexContainerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setWeexURL:(NSURL *)weexURL {
    if (_weexURL != weexURL) {
        _weexURL = weexURL;
        [self render];
    }
}

- (void)render {
    if (!self.weexURL || !self.viewController) {
        return;
    }
    CGRect frame = [UIScreen mainScreen].bounds;
    [_weexInstance destroyInstance];
    _weexInstance = [[WXSDKInstance alloc] init];
    _weexInstance.viewController = self.viewController;
    _weexInstance.frame = frame;
    
    __weak typeof(&*self) wSelf = self;
    _weexInstance.renderFinish = ^(UIView *view) {
        __strong typeof(&*wSelf) sSelf = wSelf;
        [sSelf.weexView removeFromSuperview];
        for (UIView *subView in [view subviews]) {
            //NSLog(@"%@", subView.class);
            if ([subView isKindOfClass:[UIScrollView class]]) {
                sSelf.weexView = subView;
                break;
            }
            for (UIView *ssubView in [subView subviews]) {
                if ([ssubView isKindOfClass:[UIScrollView class]]) {
                    sSelf.weexView = ssubView;
                    break;
                }
                for (UIView *sssubView in [ssubView subviews]) {
                    if ([sssubView isKindOfClass:[UIScrollView class]]) {
                        sSelf.weexView = sssubView;
                        break;
                    }
                }
            }
        }
        if (!sSelf.weexView) {
            sSelf.weexView = view;
        } else {
            if (sSelf.renderFinished) {
                sSelf.renderFinished((UIScrollView *)sSelf.weexView);
            }
        }
        [sSelf addSubview:sSelf.weexView];
    };
    
    _weexInstance.onFailed = ^(NSError *error) {
        
    };
    
    [_weexInstance renderWithURL:self.weexURL options:nil data:nil];
}

#pragma mark - Dealloc

- (void)dealloc {
    [_weexInstance destroyInstance];
}

@end
