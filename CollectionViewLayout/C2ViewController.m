//
//  C2ViewController.m
//  CollectionViewLayout
//
//  Created by fengliya on 16/12/13.
//  Copyright © 2016年 fengliya. All rights reserved.
//

#import "C2ViewController.h"
#import "C2ViewLayout.h"
#import "C1Data.h"

@interface C2ViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation C2ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.datas = [C1Data fetchDatas];
    
    C2ViewLayout *layout = [[C2ViewLayout alloc] init];
    layout.minimumLineSpacing = -10;
    layout.itemSize = CGSizeMake(self.view.frame.size.width, 100);

    UICollectionView *c2CollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    c2CollectionView.dataSource = self;
    
    c2CollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:c2CollectionView];
    
    [c2CollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
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
    if (!cell.layer.mask) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:cell.contentView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
        CAShapeLayer *mask = [CAShapeLayer layer];
        mask.frame = cell.contentView.bounds;
        mask.path = path.CGPath;
        cell.contentView.layer.mask = mask;
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
