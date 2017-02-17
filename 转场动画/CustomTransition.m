//
//  CustomTransition.m
//  转场动画
//
//  Created by xsy on 2017/2/17.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "CustomTransition.h"
#import "ViewController.h"
#import "ShowViewController.h"

@interface CustomTransition()
@property(assign,nonatomic)BOOL ispresenting;

@end
@implementation CustomTransition
-(instancetype)initWithTransition:(BOOL)ispresenting{
    if(self = [super init]){
        self.ispresenting = ispresenting;
    }
    return self;
}

//动画时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    //获取控制器
    //NSLog(@"%@",[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey]);
    //NSLog(@"%@",[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey]);
    if(self.ispresenting){
    ShowViewController *toVC = (ShowViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //获取视图
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    [transitionContext.containerView addSubview:toView];
    
    //设定presented view 一开始的位置，在屏幕下方
    CGRect rect = [transitionContext finalFrameForViewController:toVC];
    
    //开始的frame
    CGRect startRect = CGRectOffset(rect, 0, rect.size.height);
        toView.frame = startRect;
        
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.7f initialSpringVelocity:0.0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear animations:^{
        toView.frame = rect;
    } completion:^(BOOL finished) {
        if (finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }
    }];
    
    }else{
    
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
        [transitionContext.containerView addSubview:toView];
        
        
        // 添加一个动画，让要消失的 view 向下移动，离开屏幕
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.7f initialSpringVelocity:0.0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear animations:^{
            
            //secondviewcontroller 滑下去
            CGRect finalframe = fromView.frame;
            finalframe.origin.y = transitionContext.containerView.bounds.size.height;
            fromView.frame = finalframe;
            
        } completion:^(BOOL finished) {
            if (finished) {
                
                [transitionContext completeTransition:![transitionContext transitionWasCancelled] || ![transitionContext isInteractive]];
            }
            
        }];
        

    }
}




@end
