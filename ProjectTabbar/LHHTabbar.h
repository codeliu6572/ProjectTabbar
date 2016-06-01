//
//  LHHTabbar.h
//  ProjectTabbar
//
//  Created by 刘浩浩 on 16/6/1.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHHTabbar : UIView
/*
 bgImageName和isUse只能有一个使用另一个必为nil，用来设置整个Tabbar背景色
 */
-(void)creatLHHTabbarWithBackGroundImage:(NSString *)bgImageName orUseBackGroundView:(BOOL)isUse ifUseBGViewWithColor:(UIColor *)bgViewColor withViewControllerArray:(NSArray *)controllerArray withNormalImageArray:(NSArray *)normalImageArray withSelectImageArray:(NSArray *)selectImageArray withTabbarItemTitleArray:(NSArray *)itemTitleArray withTarget:(id)currentTarget withSelector:(SEL)selector;
@end
