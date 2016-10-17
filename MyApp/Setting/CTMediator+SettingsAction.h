//
//  CTMediator+SettingsAction.h
//  MyApp
//
//  Created by 黄隆 on 16/9/28.
//  Copyright © 2016年 黄隆. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>

@interface CTMediator (SettingsAction)
- (UIViewController *)mediator_settingsViewControllerWithParams:(NSDictionary *)dict;
@end
