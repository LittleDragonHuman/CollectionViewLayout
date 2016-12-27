//
//  C1Data.m
//  CollectionViewLayout
//
//  Created by fengliya on 16/12/12.
//  Copyright © 2016年 fengliya. All rights reserved.
//

#import "C1Data.h"

@implementation C1Data

+ (NSMutableArray *)fetchDatas
{
    NSMutableArray *datas = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 80; i++) {
        UIColor *color = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
        [datas addObject:color];
    }
    
    return datas;
}
@end
