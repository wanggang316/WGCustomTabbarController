//
//  LDTabbar.h
//  ldwb
//
//  Created by 王刚 on 15/1/13.
//  Copyright (c) 2015年 ccidnet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDTabbarDelegate.h"



@interface LDTabbar : UIView

@property (nonatomic, weak) id<LDTabbarDelegate> delegate;
@property (nonatomic, strong) NSArray *items;

@end



