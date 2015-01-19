//
//  LDTabbarItemCollectionView.m
//  ldwb
//
//  Created by 王刚 on 15/1/13.
//  Copyright (c) 2015年 ccidnet. All rights reserved.
//

#import "LDTabbarItemCollectionView.h"


@interface LDTabbarItemCollectionView() <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;
@end

@implementation LDTabbarItemCollectionView


- (instancetype)initWithFrame:(CGRect)frame {
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(frame.size.width/6, CGRectGetHeight(frame));
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    if (self = [super initWithFrame:frame collectionViewLayout:flowLayout]) {
        [self registerClass:[LDTabBaseCell class] forCellWithReuseIdentifier:@"cell"];
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.dataSource = self;
        self.delegate = self;
//        self.backgroundColor = LDMainColor;
    }
    return self;
}

- (void)setItems:(NSArray *)items {
    _items = items;
    NSAssert(items != nil, @"items can't be null");
    
    [self reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LDTabBaseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLabel.text = self.items[indexPath.row];
    
    cell.cellStyle = self.cellStyle;
    //
    if (indexPath.row == 0) {
        if (!self.selectedIndexPath || self.selectedIndexPath.row == 0 ) {
        [collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
            cell.isSelected = YES;
            self.selectedIndexPath = indexPath;
        } else {
            cell.isSelected = NO;
        }
    } else if (self.selectedIndexPath.row == indexPath.row) {
        cell.isSelected = YES;
        [collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
    } else {
        cell.isSelected = NO;
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = self.items[indexPath.row];
    return CGSizeMake(17 * text.length + 16, CGRectGetHeight(self.frame));
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LDTabBaseCell *cell = (LDTabBaseCell *)[collectionView cellForItemAtIndexPath:indexPath];
    self.selectedIndexPath = indexPath;
    cell.isSelected = YES;
    [self.tabbarDelegate didSelectedAtCollectionIndex:indexPath.row];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    LDTabBaseCell *cell = (LDTabBaseCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.isSelected = NO;
}


@end