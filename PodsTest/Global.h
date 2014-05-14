//
//  Macro.h
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/08.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

// デバイスのスクリーンの領域を取得する。
// ステータスバーが表示されていても表示されていなくとも、返される値は変わらない。
#define SCREEN_BOUNDS   ([UIScreen mainScreen].bounds)
// ステータスバーの領域を考慮した領域を取得する。
// ステータスバーが表示されていると、ステータスバーの領域がマイナスされた値となる。
#define APP_SCREEN_BOUNDS   ([UIScreen mainScreen].applicationFrame)
#define STATUS_BAR_HEIGHT 20
#define NAVIGATION_HEIGHT 44
#define APP_SCREEN_TOP STATUS_BAR_HEIGHT + NAVIGATION_HEIGHT
#define LOG(A, ...) NSLog(@"DEBUG: %s:%d:%@", __PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:A, ## __VA_ARGS__]);
#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r, g, b, a)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define APP_FONT_L ([UIFont fontWithName:@"AppleGothic" size:20])
#define APP_FONT_M ([UIFont fontWithName:@"AppleGothic" size:14])
#define APP_FONT_S ([UIFont fontWithName:@"AppleGothic" size:10])

#ifndef PodsTest_Macro_h
#define PodsTest_Macro_h

#endif
