//
//  LDTabbarItemCollectionView.h
//  ldwb
//
//  Created by 王刚 on 15/1/13.
//  Copyright (c) 2015年 ccidnet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDTabbarDelegate.h"
#import "LDTabBaseCell.h"

@interface LDTabbarItemCollectionView : UICollectionView

@property (nonatomic, weak) id<LDTabbarDelegate> tabbarDelegate;
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, assign) LDTabbarCellStyle cellStyle;
@end