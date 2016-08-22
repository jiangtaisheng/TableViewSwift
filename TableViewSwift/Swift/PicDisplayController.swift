//
//  PicDisplayController.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/20.
//  Copyright © 2016年 apple2015. All rights reserved.
//

import UIKit

class PicDisplayController: BaseViewController {
    
    var dataArray :NSArray = []
    var dataSoucre :NSMutableArray = NSMutableArray.init(capacity: 0)
    var index : NSInteger = 0
    
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.whiteColor()
//        let imageNames :NSArray = ["1.jpg", "2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg"]

        for i in 0...(self.dataArray.count-1){
        
            let model: ClubModel = self.dataArray[i] as!ClubModel
            self.dataSoucre .addObject(model.orgAvatar)
        }
        
        let displayView :TSBanner = TSBanner.init(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64), imageURL: self.dataSoucre as [AnyObject], ofCurrentPage: self.index) { (tag) -> Void in
            
            print(tag)

        }
        
        
       
        displayView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(displayView)
        
     
        
        
    }
    
    
    

}
