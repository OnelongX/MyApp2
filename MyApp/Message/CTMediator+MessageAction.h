//
//  CTMediator+MessageAction.h
//  MyApp
//
//  Created by 黄隆 on 16/9/28.
//  Copyright © 2016年 黄隆. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>

@interface CTMediator (MessageAction)
- (UIViewController *)mediator_messageViewControllerWithParams:(NSDictionary *)dict;
@end
