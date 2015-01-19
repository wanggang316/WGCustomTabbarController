//
//  WGTabbarControllerMacro.h
//  WGCustomTabbarController
//
//  Created by 王刚 on 15/1/19.
//  Copyright (c) 2015年 ccidnet. All rights reserved.
//

#ifndef WGCustomTabbarController_WGTabbarControllerMacro_h
#define WGCustomTabbarController_WGTabbarControllerMacro_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define LDMainColor UIColorFromRGB(0xd62322)

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#endif
