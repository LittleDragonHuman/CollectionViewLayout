//
//  C1ViewController.m
//  CollectionViewLayout
//
//  Created by fengliya on 16/12/12.
//  Copyright © 2016年 fengliya. All rights reserved.
//

#import "C1ViewController.h"
#import "C1ViewLayout.h"
#import "C1Data.h"

@interface C1ViewController ()<UICollectionViewDataSource, C1ViewLayoutDelegate>

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation C1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.datas = [C1Data fetchDatas];
    
    C1ViewLayout *layout = [[C1ViewLayout alloc] init];
    layout.columnCount = 3;
    layout.rowSpacing = 10;
    layout.columnSpacing = 10;
    layout.insets = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.delegate = self;

    UICollectionView *c1CollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    c1CollectionView.dataSource = self;
    c1CollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:c1CollectionView];
    
    [c1CollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIColor *color = self.datas[indexPath.row];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = color;
    return cell;
}

- (CGFloat)layout:(C1ViewLayout *)layout heightForWidth:(CGFloat)width indexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0f;
    height = 100 + arc4random_uniform(100);
    return height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
