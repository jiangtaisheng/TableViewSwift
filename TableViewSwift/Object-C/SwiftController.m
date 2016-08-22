//
//  SwiftController.m
//  TableViewSwift
//
//  Created by apple2015 on 16/8/20.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "SwiftController.h"
#import "TableViewSwift-swift.h"

@implementation SwiftController

- (void)viewDidLoad
{
    self.navigationItem.title=@"Object-C";
    self.view.backgroundColor=[UIColor lightGrayColor];
    
    UIButton * button =[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(100, 50, 100, 30);
    
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goto) forControlEvents:UIControlEventTouchUpInside];
    button.tag=1;
    [button setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button];
    
}

- (void)goto
{
    
     NEXTViewController * vc=[[NEXTViewController alloc]init];
    
   
    [self.navigationController pushViewController:vc animated:YES];
   
}

@end
