//
//  WGTabbarController.m
//  WGCustomTabbarController
//
//  Created by 王刚 on 15/1/19.
//  Copyright (c) 2015年 ccidnet. All rights reserved.
//

#import "WGTabbarController.h"
#import "LDTabbar.h"
#import "WGTabbarControllerMacro.h"

@interface WGTabbarController() <LDTabbarDelegate>
{
    UIView *_contentView;
}

@property (nonatomic, strong) LDTabbar *tabbar;

@end

@implementation WGTabbarController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setSelectedIndex:[self selectedIndex]];
}

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.tabbar];
    [self.view addSubview:[self contentView]];
}

- (void)setTabbarItems:(NSArray *)tabbarItems {
    _tabbarItems = tabbarItems;
    self.tabbar.items = _tabbarItems;
}

- (UIViewController *)selectedViewController {
    return [[self viewControllers] objectAtIndex:[self selectedIndex]];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (selectedIndex >= self.viewControllers.count) {
        return;
    }
    if ([self selectedViewController]) {
        [[self selectedViewController] willMoveToParentViewController:nil];
        [[[self selectedViewController] view] removeFromSuperview];
        [[self selectedViewController] removeFromParentViewController];
    }
    _selectedIndex = selectedIndex;
    
    [self setSelectedViewController:[[self viewControllers] objectAtIndex:selectedIndex]];
    [self addChildViewController:[self selectedViewController]];
    [[[self selectedViewController] view] setFrame:[[self contentView] bounds]];
    [[self contentView] addSubview:[[self selectedViewController] view]];
    [[self selectedViewController] didMoveToParentViewController:self];
}


- (void)setViewControllers:(NSArray *)viewControllers {
    if (_viewControllers && _viewControllers.count) {
        for (UIViewController *viewController in _viewControllers) {
            [viewController willMoveToParentViewController:nil];
            [viewController.view removeFromSuperview];
            [viewController removeFromParentViewController];
        }
    }
    
    if (viewControllers && [viewControllers isKindOfClass:[NSArray class]]) {
        _viewControllers = [viewControllers copy];
        
    } else {
    }
}

- (LDTabbar *)tabbar {
    if (!_tabbar) {
        _tabbar = [[LDTabbar alloc]initWithFrame:CGRectMake(0, ScreenHeight-50, ScreenWidth, 50)];
        [_tabbar setTranslatesAutoresizingMaskIntoConstraints:NO];
        _tabbar.delegate = self;
    }
    return _tabbar;
}
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-50)];
        [_contentView setBackgroundColor:[UIColor purpleColor]];
    }
    return _contentView;
}

#pragma mark - LDTabbarDelegate
- (void)didSelectedAtCollectionIndex:(NSInteger)index {
    NSLog(@"------> didselected index is %d", index);
    
    UIView * fromView = self.selectedViewController.view;
    UIView * toView = [[self.viewControllers objectAtIndex:index] view];
    
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished) {
                        if (finished) {

                        }
                    }];
    [self setSelectedIndex:index];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
