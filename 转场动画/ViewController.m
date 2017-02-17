//
//  ViewController.m
//  转场动画
//
//  Created by xsy on 2017/2/16.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewController.h"
#import "ShowPresentController.h"
#import "CustomTransition.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)sender:(UIButton *)sender {
    ShowViewController *showViewController = [[ShowViewController alloc] init];
//    showViewController.transitioningDelegate = self;
//    showViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:showViewController animated:YES completion:NULL];
    
}

///**
//  返回负责转场的控制器对象
//
// @param presented 展示的控制器
// @param presenting .发起的控制器
// @param source <#return value description#>
// @return <#return value description#>
// */
//- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
//    ShowPresentController *showPresentController = [[ShowPresentController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
//    
//    return showPresentController;
//}
//
//
///**
//  返回负责提供 Modal 动画对象
//
// @param presented 展示的控制器
// @param presenting 发起的控制器
// @param source <#source description#>
// @return <#return value description#>
// */
//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
//    return [[CustomTransition alloc] initWithTransition:YES];
//}
//
//
///**
// 返回负责 dismiss 动画对象
//
// @param dismissed <#dismissed description#>
// @return <#return value description#>
// */
//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
//    
//    return [[CustomTransition alloc] initWithTransition:NO];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}



@end
