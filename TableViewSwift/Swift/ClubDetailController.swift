//
//  ClubDetailController.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/20.
//  Copyright © 2016年 apple2015. All rights reserved.
//

import UIKit

class ClubDetailController: UIViewController {
    var clubView:ClubDetailView!
    var model:ClubModel!
    override func viewDidLoad() {
        
        
        self.creatUI()
        
    }
    
    
    func creatUI(){
        self.view.backgroundColor=UIColor.whiteColor()
        self.clubView = ClubDetailView.init(frame:self.view.bounds)
        self.clubView.config(self.model)
        self.view .addSubview(self.clubView)
    
    
    }

    
    
}
