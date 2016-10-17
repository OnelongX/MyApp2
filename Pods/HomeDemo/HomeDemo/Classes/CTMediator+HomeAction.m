//
//  CTMediator+Home.m
//  MyApp
//
//  Created by 黄隆 on 16/9/27.
//  Copyright © 2016年 黄隆. All rights reserved.
//

#import "CTMediator+HomeAction.h"



//  1. 字符串 是类名 Target_xxx.h 中的 xxx 部分
NSString * const kCTMediatorTarget_Home = @"Home";
//  2. 字符串是 Target_xxx.h 中 定义的 Action_xxxx 函数名的 xxx 部分
NSString * const kCTMediatorActionNativTo_HomeViewController = @"homeView";


@implementation CTMediator (HomeAction)

- (UIViewController *)mediator_homeViewControllerWithParams:(NSDictionary *)dict {
    
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_Home
                                                    action:kCTMediatorActionNativTo_HomeViewController
                                                    params:dict];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        NSLog(@"%@ 未能实例化页面", NSStringFromSelector(_cmd));
        return [[UIViewController alloc] init];
    }
}

@end
