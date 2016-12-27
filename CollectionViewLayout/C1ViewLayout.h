//
//  C1ViewLayout.h
//  CollectionViewLayout
//
//  Created by fengliya on 16/12/12.
//  Copyright © 2016年 fengliya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class C1ViewLayout;

@protocol C1ViewLayoutDelegate <NSObject>

@required
//根据宽度获取cell高度
- (CGFloat)layout:(C1ViewLayout *)layout heightForWidth:(CGFloat)width indexPath:(NSIndexPath *)indexPath;

@end

@interface C1ViewLayout : UICollectionViewFlowLayout

//列数
@property (nonatomic, assign) NSInteger columnCount;
//列间距
@property (nonatomic, assign) CGFloat columnSpacing;
//行间距
@property (nonatomic, assign) CGFloat rowSpacing;
//内边距
@property (nonatomic, assign) UIEdgeInsets insets;
//代理
@property (nonatomic, weak) id<C1ViewLayoutDelegate> delegate;

@end
