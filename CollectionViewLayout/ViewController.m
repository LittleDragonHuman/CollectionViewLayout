//
//  ViewController.m
//  CollectionViewLayout
//
//  Created by fengliya on 16/12/12.
//  Copyright © 2016年 fengliya. All rights reserved.
//

#import "ViewController.h"
#import "C1ViewController.h"
#import "C2ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *c1Btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 80, self.view.frame.size.width - 2 * 20, 70)];
    [c1Btn setBackgroundColor:[UIColor greenColor]];
    [c1Btn setTitle:@"万花筒" forState:UIControlStateNormal];
    [c1Btn addTarget:self action:@selector(wanhuatong) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:c1Btn];
    
    UIButton *c2Btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 170, self.view.frame.size.width - 2 * 20, 70)];
    [c2Btn setBackgroundColor:[UIColor greenColor]];
    [c2Btn setTitle:@"卡片吸顶" forState:UIControlStateNormal];
    [c2Btn addTarget:self action:@selector(cardXD) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:c2Btn];
}

- (void)wanhuatong
{
    C1ViewController *c1 = [[C1ViewController alloc] init];
    [self.navigationController pushViewController:c1 animated:YES];
}

- (void)cardXD
{
    C2ViewController *c2 = [[C2ViewController alloc] init];
    [self.navigationController pushViewController:c2 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
