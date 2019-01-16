//
//  ViewController.m
//  DAlertView
//
//  Created by Destiny on 2019/1/15.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import "ViewController.h"
#import "DAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnAction:(id)sender {
    
    DAlertView *alert =[DAlertView alertWithTitle:@"我是一个标题" message:@"文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文文本文本文本文本文本文本文本文本文本文本文本文本文本文"];
    
    DAlertAction *action1 = [DAlertAction actionWithTitle:@"确定" style:DAlertActionStyleDefault handler:^(DAlertAction * _Nonnull action) {
        NSLog(@"点击了确定");
    }];
    
    DAlertAction *action2 = [DAlertAction actionWithTitle:@"取消" style:DAlertActionStyleDefault handler:^(DAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }];
    
    alert.titleColor = [UIColor brownColor];
    alert.messageColor = [UIColor blueColor];
    action1.titleColor = [UIColor blueColor];
    action2.titleColor = [UIColor redColor];
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    [alert show];
    
}

@end
