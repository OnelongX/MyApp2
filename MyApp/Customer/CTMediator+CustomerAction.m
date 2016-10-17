//
//  CTMediator+CustomerAction.m
//  MyApp
//
//  Created by 黄隆 on 16/9/28.
//  Copyright © 2016年 黄隆. All rights reserved.
//

#import "CTMediator+CustomerAction.h"


//  1. 字符串 是类名 Target_xxx.h 中的 xxx 部分
NSString * const kCTMediatorTarget_Customer = @"Customer";
//  2. 字符串是 Target_xxx.h 中 定义的 Action_xxxx 函数名的 xxx 部分
NSString * const kCTMediatorActionNativTo_CustomerViewController = @"customerView";


@implementation CTMediator (CustomerAction)

- (UIViewController *)mediator_customerViewControllerWithParams:(NSDictionary *)dict {
    
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_Customer
                                                    action:kCTMediatorActionNativTo_CustomerViewController
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
