//
//  ViewController.m
//  Demo
//
//  Created by elliot on 2018/6/12.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import "ViewController.h"
#import "ETTMainScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    ETTMainScrollView *mainScrollView = [[ETTMainScrollView alloc] initWithFrame:self.view.bounds];
    mainScrollView.vc = self;
    [self.view addSubview:mainScrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
