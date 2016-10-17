//
//  Target_Home.m
//  MyApp
//
//  Created by 黄隆 on 16/9/27.
//  Copyright © 2016年 黄隆. All rights reserved.
//

#import "Target_Home.h"
#import "HomeViewController.h"

@implementation Target_Home

-(UIViewController*) Action_homeView:(id)sender
{
   
    return  [[UINavigationController alloc]initWithRootViewController: [[HomeViewController alloc] init]];
}

@end
