//
//  C1ViewLayout.m
//  CollectionViewLayout
//
//  Created by fengliya on 16/12/12.
//  Copyright © 2016年 fengliya. All rights reserved.
//

#import "C1ViewLayout.h"

@interface C1ViewLayout()

@property (nonatomic, strong) NSMutableArray *columnHeights;
@property (nonatomic, strong) NSMutableArray *attributesArray;
@property (nonatomic, assign) CGFloat contentHeight; //布局的contentSize的高度

@end

@implementation C1ViewLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (self.columnCount == 0) {
            self.columnCount = 3;
        }
    }
    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];
    self.contentHeight = 0.0f;
    [self.columnHeights removeAllObjects];
    for (NSInteger i = 0; i < self.columnCount; i++) {
        [self.columnHeights addObject:@(self.insets.top)];
    }
    [self.attributesArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger index = 0; index < count; index++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [self.attributesArray addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    __block NSInteger miniColumn = 0;
    __block CGFloat miniColumnHeight = [self.columnHeights[0] floatValue];
    
    [self.columnHeights enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat columnHeight = [obj floatValue];
        if (miniColumnHeight > columnHeight) {
            miniColumnHeight = columnHeight;
            miniColumn = idx;
        }
    }];
    
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    CGFloat width = 0.0f;
    CGFloat height = 0.0f;
    
    width = (self.collectionView.frame.size.width - self.insets.left - self.insets.right - self.columnSpacing * (self.columnCount - 1)) / self.columnCount;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(layout:heightForWidth:indexPath:)]) {
        height = [self.delegate layout:self heightForWidth:width indexPath:indexPath];
    }
    else {
        height = 100 + arc4random_uniform(100);
    }
    
    x = self.insets.left + miniColumn * (width + self.columnSpacing);
    y = miniColumnHeight;
    
    if (y != self.insets.top) {
        y += self.rowSpacing;
    }
    
    attributes.frame = CGRectMake(x, y, width, height);
    
    self.columnHeights[miniColumn] = @(CGRectGetMaxY(attributes.frame));
    
    CGFloat tmpHeight = [self.columnHeights[miniColumn] floatValue];
    if (self.contentHeight < tmpHeight) {
        self.contentHeight = tmpHeight;
    }
    
    return attributes;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributesArray;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), self.contentHeight + self.insets.bottom);
}

- (NSMutableArray *)columnHeights
{
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

- (NSMutableArray *)attributesArray
{
    if (!_attributesArray) {
        _attributesArray = [NSMutableArray array];
    }
    return _attributesArray;
}

@end
