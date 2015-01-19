自定义tabbarController
-------

1. 继承自UIViewController定制性更强

2.  tabbar实现横向滑动，可添加更多controller

3.  使用

		UIViewController *vc1 = [[UIViewController alloc] init];
		vc1.view.backgroundColor = [UIColor yellowColor];
    
		UIViewController *vc2 = [[UIViewController alloc] init];
		vc2.view.backgroundColor = [UIColor redColor];
    
		UIViewController *vc3 = [[UIViewController alloc] init];
		vc3.view.backgroundColor = [UIColor orangeColor];
    
		UIViewController *vc4 = [[UIViewController alloc] init];
		vc4.view.backgroundColor = [UIColor greenColor];
    
		UIViewController *vc5 = [[UIViewController alloc] init];
		vc5.view.backgroundColor = [UIColor grayColor];
    
		UIViewController *vc6 = [[UIViewController alloc] init];
		vc6.view.backgroundColor = [UIColor greenColor];
		
		WGTabbarController *tabBarVC = [[WGTabbarController alloc] init];
		tabBarVC.viewControllers = @[vc1, vc2, vc3, vc4, vc5, vc6];
		tabBarVC.tabbarItems = @[@"首页", @"收藏", @"个人中心", @"设置", @"关于", @"主题"]