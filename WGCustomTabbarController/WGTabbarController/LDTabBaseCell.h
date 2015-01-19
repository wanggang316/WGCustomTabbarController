//
//  LDTabbarCell.h
//  ldwb
//
//  Created by 王刚 on 15/1/18.
//  Copyright (c) 2015年 ccidnet. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LDTabbarCellStyleTopArrow,
    LDTabbarCellStyleBottomLine,
} LDTabbarCellStyle;

@interface LDTabBaseCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, setter=isSelected:) BOOL isSelected;

@property (nonatomic, assign) LDTabbarCellStyle cellStyle;

@end
