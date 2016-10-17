//
//  Target_Customer.m
//  MyApp
//
//  Created by 黄隆 on 16/9/28.
//  Copyright © 2016年 黄隆. All rights reserved.
//

#import "Target_Customer.h"
#import "CustomerViewController.h"

@implementation Target_Customer
-(UIViewController*) Action_customerView:(id)sender
{
     return  [[UINavigationController alloc]initWithRootViewController: [[CustomerViewController alloc] init]];
    //return [[CustomerViewController alloc]init];
}


@end
