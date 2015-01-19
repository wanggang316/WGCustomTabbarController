//
//  LDTabbarCell.m
//  ldwb
//
//  Created by 王刚 on 15/1/18.
//  Copyright (c) 2015年 ccidnet. All rights reserved.
//

#import "LDTabBaseCell.h"
#import "WGTabbarControllerMacro.h"

@interface LDTabBaseCell()
@property (nonatomic, strong) UIImageView *indicatorImageView;
@end
@implementation LDTabBaseCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.indicatorImageView];
        
        self.isSelected = NO;
    }
    return self;
}


- (void)setCellStyle:(LDTabbarCellStyle)cellStyle {
    _cellStyle = cellStyle;
    if (cellStyle == LDTabbarCellStyleTopArrow) {
        _indicatorImageView.image = [UIImage imageNamed:@"bottom_indicator"];
    } else if (cellStyle == LDTabbarCellStyleBottomLine) {
        _indicatorImageView.backgroundColor = LDMainColor;
    }
}

- (void)isSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    [self layoutSubviews];
//    if (isSelected) {
//        self.titleLabel.textColor = [UIColor whiteColor];
//        self.indicatorImageView.hidden = NO;
//    } else {
//        self.titleLabel.textColor = [UIColor lightTextColor];
//        self.indicatorImageView.hidden = YES;
//    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    
    if (self.cellStyle == LDTabbarCellStyleTopArrow) {
        self.titleLabel.frame = CGRectMake(0, 8, width, height-8);
        self.indicatorImageView.frame = CGRectMake((width-16)/2, 0, 16, 8);
        
        if (_isSelected) {
            self.titleLabel.textColor = [UIColor whiteColor];
            self.indicatorImageView.hidden = NO;
        } else {
            self.titleLabel.textColor = [UIColor lightTextColor];
            self.indicatorImageView.hidden = YES;
        }
    } else if (self.cellStyle == LDTabbarCellStyleBottomLine) {
        self.titleLabel.frame = CGRectMake(0, 0, width, height-2);
        self.indicatorImageView.frame = CGRectMake(8, height-2, width-16, 2);
        
        if (_isSelected) {
            self.titleLabel.textColor = LDMainColor;
            self.indicatorImageView.hidden = NO;
        } else {
            self.titleLabel.textColor = [UIColor darkTextColor];
            self.indicatorImageView.hidden = YES;
        }
    }
    
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.textColor = [UIColor lightTextColor];
    }
    return _titleLabel;
}

- (UIImageView *)indicatorImageView {
    if (!_indicatorImageView) {
        _indicatorImageView = [[UIImageView alloc]init];
        _indicatorImageView.contentMode = UIViewContentModeScaleAspectFit;

    }
    return _indicatorImageView;
}

@end
