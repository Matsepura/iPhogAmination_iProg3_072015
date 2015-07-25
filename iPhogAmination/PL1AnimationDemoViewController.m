//
//  PL1AnimationDemoViewController.m
//  iPhogAmination
//
//  Created by Nikolay Shubenkov on 25/07/15.
//  Copyright (c) 2015 Nikolay Shubenkov. All rights reserved.
//

#import "PL1AnimationDemoViewController.h"

@interface PL1AnimationDemoViewController ()

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view2Subview;


@end

@implementation PL1AnimationDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//Анимацию не стоит начинать раньше вызова этого метода
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showSimpleAnimation];
}

#pragma mark - UI Events

- (IBAction)randomButtonPressed:(UIButton *)sender
{
    [self showRandomAnimation];
}

#pragma mark - Animation

- (void)showRandomAnimation
{
    [UIView animateWithDuration:1
                     animations:^{
                         self.view1.frame = [self randomRect];
                         self.view1.alpha = [self randomAlpha];
                         
                         self.view2.frame = [self randomRect];
                         self.view2.alpha = [self randomAlpha];
                         
                         self.view2Subview.frame = [self randomRect];
                         self.view2Subview.alpha = [self randomAlpha];
                     } completion:^(BOOL finished) {
                         self.view.backgroundColor = [UIColor whiteColor];
                     }];
}

- (void)showSimpleAnimation
{
    [UIView animateWithDuration:3 animations:^{
        
        self.view1.center = CGPointMake(222, 440);
        self.view1.alpha  = 0;
        self.view1.backgroundColor = [UIColor purpleColor];
        
        self.view2.alpha  = 0.1;
        self.view2.center = CGPointMake(10, 500);
        self.view2.backgroundColor = [UIColor greenColor];
        
        
        CGRect newView2SubviewFrame = CGRectMake(200, -60, 150, 6);
        self.view2Subview.frame = newView2SubviewFrame;
    }];
}

- (CGRect)randomRect
{
    CGRect rect;
    rect.origin = [self randomPointWithMinX:0 maxX:250 minY:0 maxY:300];
    rect.size   = [self randomSizeWithMinWidth:40 maxWidth:200 minHeight:10 maxHeight:400];
    return rect;
}

- (CGSize)randomSizeWithMinWidth:(CGFloat)minWidth maxWidth:(CGFloat)maxWidth minHeight:(CGFloat)minHeight maxHeight:(CGFloat)maxHeight
{
    return CGSizeMake([self randomValueFromMin:minWidth toMax:maxWidth],
                      [self randomValueFromMin:minHeight toMax:maxHeight]);
}

- (CGPoint)randomPointWithMinX:(CGFloat)minX maxX:(CGFloat)maxX minY:(CGFloat)minY maxY:(CGFloat)maxY
{
    CGPoint point = CGPointZero;
    
    point = CGPointMake([self randomValueFromMin:minX toMax:maxX],
                        [self randomValueFromMin:minY toMax:maxY]);
    
    return point;
}

- (CGFloat)randomAlpha
{
    int maxValue = 100;
    return (CGFloat)[self randomValueFromMin:0 toMax:maxValue] / maxValue;
}

- (int)randomValueFromMin:(int)min toMax:(int)max
{
    NSParameterAssert(max > min);
    
    int range = max - min;
    
    int randomValueInRange = arc4random_uniform(range);
    
    int result = randomValueInRange + min;
    
    return result;
}


@end
