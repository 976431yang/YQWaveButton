# YQWaveButton

#### 微博：畸形滴小男孩
##### 水波纹按钮


### 效果预览：</br>
 ![image](https://github.com/976431yang/YQWaveButton/blob/master/screenshot.gif)

-直接拖到工程中使用
```objective-c
#import "YQWaveButton.h"
```
### Example Code:
#### 最简单使用(默认效果)：
```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //跟UIButton一样的使用
    YQWaveButton *btn = [YQWaveButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 40, 300, 100);
    btn.backgroundColor = [UIColor colorWithRed:0.991 green:0.584 blue:0.603 alpha:1.000];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [self.view addSubview:btn];

    //自定义 高亮颜色
    btn.highlightedColor = [UIColor redColor];
    
    //自定义 动画时间
    //btn.AnimationDuration = 3;
}
```