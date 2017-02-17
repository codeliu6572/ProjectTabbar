//
//  ViewController.m
//  ProjectTabbar
//
//  Created by 刘浩浩 on 16/6/1.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"
#import "LHHTabbar.h"
#import "LHHNavigationBar.h"
#import "RootViewController.h"
@interface ViewController ()

@property(nonatomic,strong)NSMutableArray *vcTabbarArray;
@property(nonatomic,strong)NSArray *vcArray;
@property(nonatomic,strong)NSArray *normalImageArray;
@property(nonatomic,strong)NSArray *selectImagerray;
@property(nonatomic,strong)NSArray *tabbarTitleArray;
@property(nonatomic,strong)UITabBarController *tabbar;

@end

@implementation ViewController
{
    LHHTabbar *_myTabbar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _vcTabbarArray=[[NSMutableArray alloc]init];
    _vcArray=[NSArray  arrayWithObjects:@"ViewController1",@"ViewController2",@"ViewController3",@"ViewController4", nil];
    _normalImageArray=[NSArray  arrayWithObjects:@"normalImage1.png",@"normalImage2",@"normalImage3",@"normalImage4", nil];
    _selectImagerray=[NSArray  arrayWithObjects:@"selectImage1.png",@"selectImage2",@"selectImage3",@"selectImage4", nil];
    _tabbarTitleArray=[NSArray arrayWithObjects:@"药房",@"咨询",@"手环",@"个人", nil];
    for (int i=0; i<_vcArray.count; i++) {
        RootViewController *tabbarVC=[[NSClassFromString(_vcArray[i]) alloc]init];
        UINavigationController * nvc=[[UINavigationController alloc]initWithRootViewController:tabbarVC];
        [_vcTabbarArray addObject:nvc];
    }
    //    自定义控件  －   真实控件的功能＋假的UI
    _tabbar=[[UITabBarController alloc]init];
    _tabbar.viewControllers=_vcTabbarArray;
    _tabbar.tabBar.alpha=0.6;
    _myTabbar=[[LHHTabbar alloc]init];
    _myTabbar.frame=CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49);
    [_myTabbar creatLHHTabbarWithBackGroundImage:nil orUseBackGroundView:YES ifUseBGViewWithColor:[UIColor orangeColor] withViewControllerArray:_vcArray withNormalImageArray:_normalImageArray withSelectImageArray:_selectImagerray withTabbarItemTitleArray:_tabbarTitleArray withTarget:self withSelector:@selector(itemAction:)];
    [_tabbar.view addSubview:_myTabbar];
    
    [self.view addSubview:_tabbar.view];

    
}
-(void)itemAction:(UIButton *)btn
{
    for (UIView * view in btn.superview.superview.subviews) {
        NSLog(@"%lu",(unsigned long)view.subviews.count);
        if (![view isKindOfClass:[UILabel class]]) {
            UIImageView * imageView=(UIImageView *)[view.subviews objectAtIndex:0];
            UILabel * label=(UILabel *)[view.subviews objectAtIndex:1];
//            NSLog(@"imageView:%d",imageView.tag);
//            NSLog(@"btn:%d",btn.tag);
            
            if (imageView.tag==btn.tag) {
//                view.backgroundColor=[UIColor grayColor];
                imageView.image=[UIImage imageNamed:_selectImagerray[btn.tag]];
                label.textColor=[UIColor colorWithRed:0.00f green:0.76f blue:0.83f alpha:1.00f];
            }
            else
            {
//                view.backgroundColor=[UIColor clearColor];
                imageView.image=[UIImage imageNamed:_normalImageArray[imageView.tag]];
                label.textColor=[UIColor whiteColor];
            }
        }
        
    }
    _tabbar.selectedIndex=btn.tag;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
