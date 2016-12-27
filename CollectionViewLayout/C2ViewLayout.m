//
//  C2ViewLayout.m
//  CollectionViewLayout
//
//  Created by fengliya on 16/12/13.
//  Copyright © 2016年 fengliya. All rights reserved.
//

#import "C2ViewLayout.h"

@implementation C2ViewLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *oldItems = [super layoutAttributesForElementsInRect:rect];
    [oldItems enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self handleItemAttributes:obj];
    }];
    return oldItems;
}

- (void)handleItemAttributes:(UICollectionViewLayoutAttributes *)attribute
{
    //悬停处的y值
    CGFloat topY = CGRectGetMinY(self.collectionView.bounds) + self.collectionView.contentInset.top;
    //最终应该出现的位置y
    CGFloat finalY = MAX(topY, attribute.frame.origin.y);
    CGPoint origin = attribute.frame.origin;
    origin.y = finalY;
    attribute.frame = (CGRect){origin, attribute.frame.size};
    attribute.zIndex = attribute.indexPath.row;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

@end
