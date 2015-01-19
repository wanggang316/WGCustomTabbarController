//
//  WGTabbarController.h
//  WGCustomTabbarController
//
//  Created by 王刚 on 15/1/19.
//  Copyright (c) 2015年 ccidnet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGTabbarController : UIViewController

@property (nonatomic, copy) IBOutletCollection(UIViewController) NSArray *viewControllers;

@property (nonatomic, strong) NSArray *tabbarItems;

@property (nonatomic, weak) UIViewController *selectedViewController;
@property (nonatomic) NSUInteger selectedIndex;
@end
