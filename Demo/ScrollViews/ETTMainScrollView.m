//
//  ETTMainScrollView.m
//  Demo
//
//  Created by elliot on 2018/6/12.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import "ETTMainScrollView.h"
#import "UIScrollView+ETTEmbedScrollView.h"
#import "ETTTextTableViewCell.h"
#import "ETTWeexTableViewCell.h"
#import "ETTEmbedScrollView.h"

#define ETT_INSET_INDEX (25)

@interface ETTMainScrollView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ETTMainScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[ETTTextTableViewCell class] forCellReuseIdentifier:[ETTTextTableViewCell cellReuseIdentifier]];
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"embedScrollViewCellId"];
    //[self registerClass:[ETTWeexTableViewCell class] forCellReuseIdentifier:[ETTWeexTableViewCell cellReuseIdentifier]];
}

- (NSURL *)weexURL {
    NSString *localPath = [[NSBundle mainBundle] pathForResource:@"rax" ofType:@"js"];
    return [NSURL fileURLWithPath:localPath];//[NSURL URLWithString:@"http://30.11.180.20:9999/js/index.bundle.js?_wx_tpl=http://30.11.180.20:9999/js/index.bundle.js"];//
}

#pragma mark - Delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == ETT_INSET_INDEX) {
        return self.bounds.size.height;
    }
    else {
        return 100;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == ETT_INSET_INDEX) {
        /*
        ETTWeexTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ETTWeexTableViewCell cellReuseIdentifier] forIndexPath:indexPath];
        cell.tableView = tableView;
        [cell setWeexURL:[self weexURL] viewController:self.vc];
         */
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"embedScrollViewCellId" forIndexPath:indexPath];
        if (!cell.backgroundView) {
            ETTEmbedScrollView *embedScrollView = [[ETTEmbedScrollView alloc] initWithFrame:self.bounds];
            cell.backgroundView = embedScrollView;
            embedScrollView.ett_top = cell.frame.origin.y;
            self.ett_embedScrollView = embedScrollView;
        }
        return cell;
    } else {
        ETTTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ETTTextTableViewCell cellReuseIdentifier] forIndexPath:indexPath];
        [cell setText:@"Siri的更新重点是加入了Shortcuts功能，这个功能简单来说就是苹果将之前收购的Workflow工作流软件整合了进来——针对特殊App的某些功能设置属于自己的命令。"];
        return cell;
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self ett_mainScrollViewDidScrolled];
}

@end
