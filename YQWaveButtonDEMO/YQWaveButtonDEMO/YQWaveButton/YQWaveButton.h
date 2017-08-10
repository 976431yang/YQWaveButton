//
//  YQButton.h
//  testBTN
//
//  Created by problemchild on 2017/8/10.
//  Copyright © 2017年 FreakyYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YQWaveButton : UIButton

//动画时间，默认为1秒
@property (nonatomic,assign) NSTimeInterval AnimationDuration;
//动画颜色
@property (nonatomic,strong) UIColor        *highlightedColor;

@end
