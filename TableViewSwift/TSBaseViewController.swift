//
//  TSBaseViewController.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/20.
//  Copyright © 2016年 apple2015. All rights reserved.
//

import UIKit

class TSBaseViewController: BaseViewController {

    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.hidden=false
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden=true

    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        self.tabBarController?.tabBar.hidden=false

    }
    
    
    override func viewDidDisappear(animated: Bool) {
        
        super.viewDidDisappear(animated)
        self.tabBarController?.tabBar.hidden=true

    }
}
