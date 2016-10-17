//
//  Target_message.m
//  MyApp
//
//  Created by 黄隆 on 16/9/28.
//  Copyright © 2016年 黄隆. All rights reserved.
//

#import "Target_Message.h"
#import "MessageViewController.h"

@implementation Target_Message
-(UIViewController*) Action_messageView:(id)sender
{
    return  [[UINavigationController alloc]initWithRootViewController: [[MessageViewController alloc] init]];
    
}


@end
