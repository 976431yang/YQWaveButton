//
//  YQButton.m
//  testBTN
//
//  Created by problemchild on 2017/8/10.
//  Copyright © 2017年 FreakyYang. All rights reserved.
//

#import "YQWaveButton.h"

@interface YQButtonCircleSet : NSObject

@property CGFloat circleCenterX;
@property CGFloat circleCenterY;
@property CGFloat circleWidth;
@property CGFloat circleRait;

@end

@implementation YQButtonCircleSet

@end

@interface YQWaveButton ()

@property (nonatomic, assign) int loopCount;

@property (nonatomic, strong) NSMutableDictionary *circles;

@property (nonatomic, assign) int circleFlag;

@end

@implementation YQWaveButton

- (void)setAnimationDuration:(NSTimeInterval)AnimationDuration {
    _animationDuration = AnimationDuration;
    self.loopCount = self.animationDuration / 0.02;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat endAngle = M_PI * 2;
    
    for (YQButtonCircleSet *circleSet in self.circles.allValues) {
        CGContextAddArc(context,
                        circleSet.circleCenterX,
                        circleSet.circleCenterY,
                        circleSet.circleWidth * circleSet.circleRait,
                        0,
                        endAngle,
                        NO);
        [[self.highlightedColor colorWithAlphaComponent:(1-circleSet.circleRait)] setStroke];
        [[self.highlightedColor colorWithAlphaComponent:(1-circleSet.circleRait)] setFill];
        
        CGContextFillPath(context);
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.highlightedColor = [UIColor clearColor];
    
    self.animationDuration = 1;
    self.loopCount = self.animationDuration / 0.02;
    
    self.circles = [NSMutableDictionary dictionary];
    self.circleFlag = 0;
    
    [self addTarget:self action:@selector(touchedDown:event:) forControlEvents:UIControlEventTouchDown];
    
    return self;
}

- (void)touchedDown:(UIButton *)btn event:(UIEvent *)event {
    
    UITouch *touch = event.allTouches.allObjects.firstObject;
    CGPoint touchePoint = [touch locationInView:btn];
    
    NSString *key = [NSString stringWithFormat:@"%d",self.circleFlag];
    YQButtonCircleSet *set = [YQButtonCircleSet new];
    set.circleCenterX = touchePoint.x;
    set.circleCenterY = touchePoint.y;
    set.circleRait = 0;
    
    CGFloat maxX = touchePoint.x>(self.frame.size.width-touchePoint.x)?touchePoint.x:(self.frame.size.width-touchePoint.x);
    CGFloat maxY = touchePoint.y>(self.frame.size.width-touchePoint.y)?touchePoint.y:(self.frame.size.height-touchePoint.y);
    set.circleWidth = maxX>maxY?maxX:maxY;
    
    [self.circles setObject:set forKey:key];

    NSTimer *timer = [NSTimer timerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(timerFunction:)
                                           userInfo:@{@"key": key}
                                            repeats:YES];
    
    [NSRunLoop.mainRunLoop addTimer:timer forMode:NSRunLoopCommonModes];
    
    self.circleFlag++;
}

- (void)timerFunction:(NSTimer *)timer {
    
    [self setNeedsDisplay];
    
    NSDictionary *userInfo = timer.userInfo;
    
    NSString *key = userInfo[@"key"];
    
    YQButtonCircleSet *set = self.circles[key];
    
    if (set.circleRait <= 1) {
        
        set.circleRait += (1.0 / self.loopCount);
        
    } else {
        [self.circles removeObjectForKey:key];
        
        [timer invalidate];
    }
}

@end
