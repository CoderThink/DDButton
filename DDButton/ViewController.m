//
//  ViewController.m
//  DDButton
//
//  Created by Think on 2017/9/18.
//  Copyright © 2017年 Think. All rights reserved.
//

#import "ViewController.h"
#import "DDButton.h"

@interface ViewController ()
@property (nonatomic,weak) DDButton *testButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DDButton *testButton = [DDButton buttonWithType:UIButtonTypeCustom];
    
    testButton.frame = CGRectMake(100, 100, 100, 30);
    
    testButton.backgroundColor = [UIColor redColor];
    
    [testButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [testButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    
    [testButton setTitle:@"测试" forState:UIControlStateNormal];
    
    testButton.titleRect = CGRectMake(10, 0, 50, 30);
    
    testButton.imageRect = CGRectMake(60, 8, 14, 14);
    
    
    self.testButton = testButton;
    [self.view addSubview:testButton];
}


@end
