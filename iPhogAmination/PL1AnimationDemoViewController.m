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
        self.view1.center = CGPointMake(222, 440);
        self.view1.alpha = 0;
        self.view1.backgroundColor = [UIColor purpleColor];
        
        self.view2.alpha = 0.1;
        self.view2.center = CGPointMake(10, 500);
        self.view2.backgroundColor = [UIColor greenColor];
        
        CGRect newView2SubviewFrame = CGRectMake(200, -60, 150, 6);
        self.view2Subview.frame = newView2SubviewFrame;
        
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
