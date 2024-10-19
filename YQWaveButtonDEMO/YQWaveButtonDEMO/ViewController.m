//
//  ViewController.m
//  YQWaveButtonDEMO
//
//  Created by problemchild on 2017/8/10.
//  Copyright © 2017年 FreakyYang. All rights reserved.
//

#import "YQWaveButton.h"

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //跟UIButton一样的使用
    YQWaveButton *btn = [YQWaveButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 100, 300, 100);
    btn.backgroundColor = [UIColor colorWithRed:0.991 green:0.584 blue:0.603 alpha:1.000];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
    //自定义 高亮颜色
    btn.highlightedColor = [UIColor redColor];
    
    //自定义 动画时间
    //btn.AnimationDuration = 3;
    
}


@end
