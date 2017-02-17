//
//  ShowPresentController.m
//  转场动画
//
//  Created by xsy on 2017/2/16.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ShowPresentController.h"

@interface ShowPresentController()
@property(strong,nonatomic)UIView *bgView;
@end
@implementation ShowPresentController

/**
 用来负责转场动画的

 @param presentedViewController 被展现的控制器
 @param presentingViewController 发起转场的控制器,
 @return <#return value description#>
 */
-(instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController{

    if(self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]){
    
        
        
    }
    
    NSLog(@"%@",presentedViewController);
    NSLog(@"%@",presentingViewController);
       return self;
}

-(void)presentationTransitionWillBegin{
    [self.containerView addSubview:self.presentingViewController.view];
    [self.containerView addSubview:self.bgView];
    
    self.bgView.alpha = 0.0;
    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.bgView.alpha = 0.7;
        self.presentingViewController.view.transform = CGAffineTransformScale(self.presentingViewController.view.transform, 0.92, 0.92);
    } completion:nil];
    
    
}

- (BOOL)shouldRemovePresentersView{
    return NO;
}


//在呈现过渡结束时被调用的
//如果呈现没有完成，那就移除背景 View
- (void)presentationTransitionDidEnd:(BOOL)completed{
    if (!completed) {
        [self.bgView removeFromSuperview];
    }
}
- (void)dismissalTransitionWillBegin{

    [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.bgView.alpha = 0.0;
        self.presentingViewController.view.transform = CGAffineTransformIdentity;
    } completion:nil];
    
}
- (void)dismissalTransitionDidEnd:(BOOL)completed{
    if (completed) {
        [self.bgView removeFromSuperview];
    }

[[[UIApplication sharedApplication]keyWindow]addSubview:self.presentingViewController.view];
}


- (void)containerViewWillLayoutSubviews{
    
  
}

-(UIView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
        _bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}
-(void)close{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:NULL];
    
}

-(CGRect)frameOfPresentedViewInContainerView{

    return  CGRectMake(0, 260,375, 667-260);
}

@end
