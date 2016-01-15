//
//  AKViewController.m
//  TransactionAnimations
//
//  Created by Alex Kopachev on 01/15/2016.
//  Copyright (c) 2016 Alex Kopachev. All rights reserved.
//

#import "AKViewController.h"
#import "UIView+PositionTransaction.h"

@interface AKViewController ()

@property (weak, nonatomic) IBOutlet UIView *cube;

@end

@implementation AKViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSelector:@selector(animate) withObject:nil afterDelay:4];
}

- (void)animate
{
    CGRect rect = self.view.bounds;
    [self.cube positionTransactionWithDuration:0.3
                                       toPoint:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
                                    completion:^{
        [self.cube positionTransactionWithDuration:0.4
                                           toPoint:CGPointMake(CGRectGetMidX(rect) - 150, CGRectGetMidY(rect) - 100)
                                    timingFunction:[CAMediaTimingFunction functionWithControlPoints:.75:0:1:.5]
                                        /*http://cubic-bezier.com/#.75,0,1,.5*/
                                        completion:nil];
    }];
}

@end
