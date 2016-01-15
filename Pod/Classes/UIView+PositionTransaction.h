//
//  UIView+PositionTransaction.h
//  Pods
//
//  Created by Alex Kopachev on 15.01.16.
//
//

#import <UIKit/UIKit.h>

@interface UIView (PositionTransaction)

- (void)positionTransactionWithDuration:(NSTimeInterval)duration
                                  delay:(NSTimeInterval)delay
                              fromPoint:(CGPoint)fromPoint
                                toPoint:(CGPoint)toPoint
                         timingFunction:(CAMediaTimingFunction *)timingFunction
                             completion:(void (^)())completion;

- (void)positionTransactionWithDuration:(NSTimeInterval)duration
                                toPoint:(CGPoint)toPoint
                         timingFunction:(CAMediaTimingFunction *)timingFunction
                             completion:(void (^)())completion;

- (void)positionTransactionWithDuration:(NSTimeInterval)duration
                                  delay:(NSTimeInterval)delay
                              fromPoint:(CGPoint)fromPoint
                                toPoint:(CGPoint)toPoint
                             completion:(void (^)())completion;

- (void)positionTransactionWithDuration:(NSTimeInterval)duration
                                  delay:(NSTimeInterval)delay
                                toPoint:(CGPoint)toPoint
                             completion:(void (^)())completion;

- (void)positionTransactionWithDuration:(NSTimeInterval)duration
                                toPoint:(CGPoint)toPoint
                             completion:(void (^)())completion;

@end
