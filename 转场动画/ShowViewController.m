//
//  ShowViewController.m
//  转场动画
//
//  Created by xsy on 2017/2/16.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ShowViewController.h"
#import "CustomTransition.h"
#import "ShowPresentController.h"

@interface ShowViewController ()
{   //创建过度对象  弹出viewController
    UIPercentDrivenInteractiveTransition *_percentDrivenInteractiveTransition;
    
}
@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self setUI];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate  = self;
        
    }
    return self;
}


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate  = self;
        
    }
    return self;
}


-(void)setUI{

    UIPanGestureRecognizer *tap = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:tap];
}
-(void)panAction:(UIPanGestureRecognizer *)pan{

    CGFloat pointY = [pan translationInView:self.view].y;
    CGFloat pointM = [pan locationInView:self.view].y;
    
    CGFloat Y = pointY / (self.view.frame.size.height * 3.0);
    
    //更新速率
    CGFloat interactiveTransition = pointY / 1800;
    
    NSLog(@"pointY == %f",pointY);
    NSLog(@"pointM == %f",pointM);
    NSLog(@"Y == %f",Y);
    NSLog(@"interactiveTransition == %f",interactiveTransition);
    
    if (pan.state == UIGestureRecognizerStateBegan) {//点击屏幕时创建过度对象
        _percentDrivenInteractiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        //此时控制器开始消失
       [self dismissViewControllerAnimated:YES completion:nil];
    }else if(pan.state == UIGestureRecognizerStateChanged){
        [_percentDrivenInteractiveTransition updateInteractiveTransition:interactiveTransition];
        
    }else if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled){
        [_percentDrivenInteractiveTransition finishInteractiveTransition];
        
        //销毁
        _percentDrivenInteractiveTransition = nil;
    }

}

/**
 返回负责转场的控制器对象
 
 @param presented 展示的控制器
 @param presenting .发起的控制器
 @param source <#return value description#>
 @return <#return value description#>
 */
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    ShowPresentController *showPresentController = [[ShowPresentController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    
    return showPresentController;
}


/**
 返回负责提供 Modal 动画对象
 
 @param presented 展示的控制器
 @param presenting 发起的控制器
 @param source <#source description#>
 @return <#return value description#>
 */
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[CustomTransition alloc] initWithTransition:YES];
}


/**
 返回负责 dismiss 动画对象
 
 @param dismissed <#dismissed description#>
 @return <#return value description#>
 */
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    if (dismissed) {
        
        return [[CustomTransition alloc] initWithTransition:NO];;
    }else{
        return nil;
    }
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    
    if (animator) {
        return _percentDrivenInteractiveTransition;
    }else{
        return nil;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
