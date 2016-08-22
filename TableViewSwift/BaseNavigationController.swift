//
//  BaseNavigationController.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/18.
//  Copyright © 2016年 apple2015. All rights reserved.
//

//import Cocoa
import UIKit
class BaseNavigationController: UINavigationController {
    
//     override init(rootViewController: UIViewController) {
//       
//        super.init(rootViewController: rootViewController)
//        //修改导航栏背景色
//        self.navigationController?.navigationBar.barTintColor =
//            UIColor(red: 55/255, green: 186/255, blue: 89/255, alpha: 1)
//        
//        
//        //修改导航栏文字颜色
//        self.navigationController?.navigationBar.titleTextAttributes =
//            [NSForegroundColorAttributeName: UIColor.whiteColor()]
//
//        
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        self.navigationController?.navigationBar.barTintColor =
//            UIColor(red: 55/255, green: 186/255, blue: 89/255, alpha: 1)
//        
//        
//        //修改导航栏文字颜色
//        self.navigationController?.navigationBar.titleTextAttributes =
//            [NSForegroundColorAttributeName: UIColor.whiteColor()]
//    }

    
    
    override func viewDidLoad() {
        
        self.navigationBar
            .setBackgroundImage(UIImage(named: "top_bar_bg.png"), forBarMetrics: .Default)
            UIApplication.sharedApplication().statusBarStyle=UIStatusBarStyle.LightContent
        self.navigationBar.titleTextAttributes =
                    [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
    }
    
    
    /**
    
      重写push 和pop 方法  隐藏tabBar
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        super.pushViewController(viewController, animated: animated)

        if(self.viewControllers.count>=2){
            
            self.tabBarController?.tabBar.hidden=true
            
        }else{
            
            self.tabBarController?.tabBar.hidden=false;
            
        }

    }
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        
        if(self.viewControllers.count>2){
            
            self.tabBarController?.tabBar.hidden=true
            
        }else{
            
            self.tabBarController?.tabBar.hidden=false;
            
        }

        
        return  super.popViewControllerAnimated(animated)
    }
    
     */
}
