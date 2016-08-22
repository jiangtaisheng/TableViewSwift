//
//  TSTabBarController.swiftTA
//  TableViewSwift
//
//  Created by apple2015 on 16/8/19.
//  Copyright © 2016年 apple2015. All rights reserved.
//

import UIKit

class TSTabBarController: UITabBarController{

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.createTabBarItems()

        self.createTabBar()
        
    }
    
    func createTabBar(){
        
        let   unSelectArray :NSArray = ["tab_weixin_normal","tab_address_normal.png","tab_find_frd_normal.png","tab_settings_normal.png"]
        let selectArray :NSArray = ["tab_weixin_pressed.png","tab_address_pressed.png","tab_find_frd_pressed.png","tab_settings_pressed.png"]
        let titleArray :NSArray = ["聊天","通讯录","发现","我"]

        var i:Int = 0
        for (; i<titleArray.count; i++) {
            //读取tabBarItem
            var item:UITabBarItem = self.tabBar.items![i];
            //如果我们不处理图片，那么图片显示则是阴影
            var selectImage :UIImage = UIImage(named:selectArray[i] as! String)!
            selectImage=selectImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            var unSelectImage :UIImage = UIImage(named:unSelectArray[i] as! String)!
            unSelectImage=unSelectImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            
//            item=item.dynamicType.init(title:titleArray[i] as? String, image:unSelectImage, selectedImage: selectImage)
            
            item.title =  titleArray[i] as? String
            item.image = unSelectImage
            item.selectedImage = selectImage
            
//            item.imageInsets = UIEdgeInsetsMake(10, -5, 5, 5)
            
            //设置普通颜色
            //[item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateNormal];
            //设置选中颜色
            item.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.init(colorLiteralRed: 55/255.0, green: 238/255.0, blue: 115/255.0, alpha: 1)], forState: UIControlState.Selected)

        }

    }
    
    func createTabBarItems(){
    
     self.viewControllers = [BaseNavigationController.init(rootViewController: ViewController()),BaseNavigationController.init(rootViewController: SubViewController()),BaseNavigationController.init(rootViewController: ClubViewController()),BaseNavigationController.init(rootViewController: CollectionView())]
        
    
    
    }
    
    
}
