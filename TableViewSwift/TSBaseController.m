//
//  TSBaseController.m
//  TableViewSwift
//
//  Created by apple2015 on 16/8/20.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "TSBaseController.h"

@implementation TSBaseController
- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    self.tabBarController.tabBar.hidden=NO;
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
    self.tabBarController.tabBar.hidden=YES;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=NO;

}

- (void) viewWillDisappear:(BOOL)animated
{
    
    
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=YES;

}

@end
