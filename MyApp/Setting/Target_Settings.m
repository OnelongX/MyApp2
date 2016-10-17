//
//  Target_Settings.m
//  MyApp
//
//  Created by 黄隆 on 16/9/28.
//  Copyright © 2016年 黄隆. All rights reserved.
//

#import "Target_Settings.h"
#import "SettingViewController.h"

@implementation Target_Settings
-(UIViewController*) Action_settingView:(id)sender
{
     return  [[UINavigationController alloc]initWithRootViewController: [[SettingViewController alloc] init]];
}


@end
