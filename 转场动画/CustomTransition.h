//
//  CustomTransition.h
//  转场动画
//
//  Created by xsy on 2017/2/17.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CustomTransition : NSObject<UIViewControllerAnimatedTransitioning>

/**
 用来做转场动画

 @param ispresenting YES 显示 NO 消失
 @return <#return value description#>
 */
-(instancetype)initWithTransition:(BOOL)ispresenting;
@end
