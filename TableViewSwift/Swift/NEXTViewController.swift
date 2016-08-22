//
//  NEXTViewController.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/20.
//  Copyright © 2016年 apple2015. All rights reserved.
//

import UIKit

class NEXTViewController: TSBaseViewController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blueColor()
        let btn:UIButton = UIButton.init(type: UIButtonType.System)
        btn.frame = CGRectMake(100, 100, 100, 30)
        btn.setTitle("上一页", forState: UIControlState.Normal)
        btn.addTarget(self, action: "goback:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view .addSubview(btn)
    }
    
    
    func goback(btn:UIButton){
    
    
       self.navigationController!.popViewControllerAnimated(true)
    
    }
    

}
