//
//  HomeViewController.m
//  MyApp
//
//  Created by 黄隆 on 16/9/27.
//  Copyright © 2016年 黄隆. All rights reserved.
//

#import "HomeViewController.h"
#import "DESHelper.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"首页";
    //self.view.backgroundColor=[UIColor redColor];
    // Do any additional setup after loading the view from its nib.
    
   NSString* dd = [DESHelper encryptUseAES:@"nihaoma" key:@"555ddddsss"];
   NSLog(@"%@",dd);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
