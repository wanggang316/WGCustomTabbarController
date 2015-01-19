//
//  LDTabbar.m
//  ldwb
//
//  Created by 王刚 on 15/1/13.
//  Copyright (c) 2015年 ccidnet. All rights reserved.
//

#import "LDTabbar.h"
#import "LDTabbarItemCollectionView.h"
//#import "LDTabbarCell.h"

@interface LDTabbar()

@property (nonatomic, strong) LDTabbarItemCollectionView *collectionView;

@property (nonatomic, strong) UILabel *bottomLabel;
@end

@implementation LDTabbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = LDMainColor;

        
        _collectionView = [[LDTabbarItemCollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame)-5)];
        _collectionView.cellStyle = LDTabbarCellStyleTopArrow;
        _collectionView.backgroundColor = self.backgroundColor;
        [self addSubview:_collectionView];
        
//        [self addSubview:self.indicatorImageView];
        [self addSubview:self.bottomLabel];
    }
    return self;
}

- (void)setDelegate:(id<LDTabbarDelegate>)delegate {
    _delegate = delegate;
    self.collectionView.tabbarDelegate = _delegate;
}

- (void)setItems:(NSArray *)items {
    _items = items;
    _collectionView.items = items;
}


- (UILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-8, CGRectGetWidth(self.frame), 8)];
        _bottomLabel.text = @"北京赛迪网信息技术有限公司";
        _bottomLabel.font = [UIFont systemFontOfSize:8];
        _bottomLabel.textColor = [UIColor lightTextColor];
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _bottomLabel;
}



@end