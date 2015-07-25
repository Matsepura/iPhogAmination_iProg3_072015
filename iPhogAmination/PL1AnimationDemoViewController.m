//
//  PL1AnimationDemoViewController.m
//  iPhogAmination
//
//  Created by Semen on 25.07.15.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showSimpleAnimation];
}

#pragma mark - Animation

-(void)showSimpleAnimation{
    [UIView animateWithDuration:0.7 animations:^{
        self.view1.center = CGPointMake(222, 44);
        self.view1.alpha = 0;
        self.view1.backgroundColor = [UIColor purpleColor];
        
        self.view2.alpha = 0.1;
        self.view2.center = CGPointMake(900, 500);
        self.view2.backgroundColor = [UIColor greenColor];
        
        CGRect newView2SubviewFrame = CGRectMake(200, -60, 150, 6);
        self.view2Subview.frame = newView2SubviewFrame;
        
    }];
}



-(CGPoint)randomPointWithMinX:(CGFloat)minX maxX:(CGFloat)maxX minY:(CGFloat)minY maxY:(CGFloat)maxY
{
    CGPoint point = CGPointZero;
    
    point = CGPointMake([self randomValueFromMinValue:minX toMax:maxX],
                        [self randomValueFromMinValue:minY toMax:maxY]);
    
    
    return point;
}

-(CGFloat)randomAplha
{
    int maxValue = 100;
    return (CGFloat)[self randomValueFromMinValue:0 toMax:maxValue] / maxValue;
}


-(NSInteger)randomValueFromMinValue:(NSInteger)min toMax:(NSInteger)max
{
    NSParameterAssert(max > min);
    NSInteger maxPoint = max - min;
    NSInteger randomValue = (NSInteger)arc4random_uniform((NSInteger)maxPoint) + min;
    NSLog(@"%ld", randomValue);
    return randomValue;

}





@end
