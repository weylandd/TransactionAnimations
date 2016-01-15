//
//  UIView+PositionTransaction.m
//  Pods
//
//  Created by Alex Kopachev on 15.01.16.
//
//

#import "UIView+PositionTransaction.h"

typedef void(^CodeBlock)(void);
void _dispatchAfter(CGFloat time, CodeBlock block)
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (time * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

@implementation UIView (PositionTransaction)

- (void)positionTransactionWithDuration:(NSTimeInterval)duration
                                  delay:(NSTimeInterval)delay
                              fromPoint:(CGPoint)fromPoint
                                toPoint:(CGPoint)toPoint
                         timingFunction:(CAMediaTimingFunction *)timingFunction
                             completion:(void (^)())completion
{
    _dispatchAfter(delay, ^{
        [CATransaction begin];
        CABasicAnimation *animPosition = [CABasicAnimation animationWithKeyPath:@"position"];
        animPosition.fromValue = [self _valueWithPoint:fromPoint];
        animPosition.toValue = [self _valueWithPoint:toPoint];
        animPosition.duration = duration;
        animPosition.timingFunction = timingFunction;
        
        [CATransaction setCompletionBlock:^{
            if (completion)
            {
                completion();
            }
        }];
        [self.layer addAnimation:animPosition forKey:nil];
        self.layer.position = [self _offsetToCenter:toPoint];
        [CATransaction commit];
    });
}

- (void)positionTransactionWithDuration:(NSTimeInterval)duration
                                toPoint:(CGPoint)toPoint
                         timingFunction:(CAMediaTimingFunction *)timingFunction
                             completion:(void (^)())completion
{
    CGPoint fromPoint = self.frame.origin;
    [self positionTransactionWithDuration:duration delay:0.f fromPoint:fromPoint toPoint:toPoint timingFunction:timingFunction completion:completion];
}

- (void)positionTransactionWithDuration:(NSTimeInterval)duration
                                  delay:(NSTimeInterval)delay
                              fromPoint:(CGPoint)fromPoint
                                toPoint:(CGPoint)toPoint
                             completion:(void (^)())completion
{
    [self positionTransactionWithDuration:duration delay:delay fromPoint:fromPoint toPoint:toPoint timingFunction:[CAMediaTimingFunction functionWithControlPoints:.5:0:.5:1] completion:completion];
}

- (void)positionTransactionWithDuration:(NSTimeInterval)duration
                                  delay:(NSTimeInterval)delay
                                toPoint:(CGPoint)toPoint
                             completion:(void (^)())completion
{
    CGPoint fromPoint = self.frame.origin;
    [self positionTransactionWithDuration:duration delay:delay fromPoint:fromPoint toPoint:toPoint completion:completion];
}

- (void)positionTransactionWithDuration:(NSTimeInterval)duration
                                toPoint:(CGPoint)toPoint
                             completion:(void (^)())completion
{
    [self positionTransactionWithDuration:duration delay:0.f toPoint:toPoint completion:completion];
}

#pragma mark - private

- (NSValue *)_valueWithPoint:(CGPoint)point
{
    return [NSValue valueWithCGPoint:[self _offsetToCenter:point]];
}

- (CGPoint)_offsetToCenter:(CGPoint)point
{
    CGRect rect = self.bounds;
    CGFloat x = point.x + CGRectGetMidX(rect);
    CGFloat y = point.y + CGRectGetMidY(rect);
    return CGPointMake(x, y);
}

@end
