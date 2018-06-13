//
//  ETTEmbedScrollView.m
//  Demo
//
//  Created by elliot on 2018/6/12.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import "ETTEmbedScrollView.h"
#import "ETTImageTextTableViewCell.h"

@implementation ETTEmbedScrollView

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
    [self registerClass:[ETTImageTextTableViewCell class] forCellReuseIdentifier:[ETTImageTextTableViewCell cellReuseIdentifier]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ETTImageTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ETTImageTextTableViewCell cellReuseIdentifier] forIndexPath:indexPath];
    [cell setText:[NSString stringWithFormat:@"embed %ld", indexPath.row]];
    return cell;
}

@end
