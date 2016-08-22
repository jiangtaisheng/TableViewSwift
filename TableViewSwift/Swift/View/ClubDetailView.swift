//
//  ClubDetailView.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/20.
//  Copyright © 2016年 apple2015. All rights reserved.
//

import UIKit

class ClubDetailView: UIView {
    var avatarView :UIImageView!
    var nameLabel :UILabel!
    var orgLabel :UILabel!
    var groupLabel :UILabel!
    var userLabel :UILabel!
    
    override  init(frame: CGRect) {
       
        super.init(frame: frame)
        if self.isEqual(nil){
            return ;
        }
        
        self.createUI()
    }

    
    func createUI (){
    
        self.avatarView = UIImageView(frame: CGRectMake((self.frame.width-60)/2, 10, 60, 60))
        self.avatarView.layer.cornerRadius=30
        self.avatarView.layer.masksToBounds=true
        
        self.nameLabel = UILabel(frame:CGRectMake(10,CGRectGetMaxY(self.avatarView.frame)+10,self.frame.width,20))
        self.nameLabel.font = UIFont.systemFontOfSize(16)
        self.nameLabel.textAlignment = NSTextAlignment.Center
        
        self.orgLabel = UILabel(frame:CGRectMake(10,CGRectGetMaxY(self.nameLabel.frame)+10,self.frame.width,20))
        self.orgLabel.font = UIFont.systemFontOfSize(16)
        self.orgLabel.textAlignment = NSTextAlignment.Center
        
        self.groupLabel = UILabel(frame:CGRectMake(10,CGRectGetMaxY(self.orgLabel.frame)+10,self.frame.width,20))
        self.groupLabel.font = UIFont.systemFontOfSize(16)
        self.groupLabel.textAlignment = NSTextAlignment.Center
    
        self.userLabel = UILabel(frame:CGRectMake(10,CGRectGetMaxY(self.groupLabel.frame)+10,self.frame.width,20))
        self.userLabel.font = UIFont.systemFontOfSize(16)
        self.userLabel.textAlignment = NSTextAlignment.Center
        
        self.addSubview(self.avatarView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.orgLabel)
        self.addSubview(self.groupLabel)
        self.addSubview(self.userLabel)
        
    }
    
    func config(model:ClubModel){
    
        self.avatarView .sd_setImageWithURL(NSURL(string: model.orgAvatar), placeholderImage: UIImage(named: "head"))
        self.nameLabel.text=NSString(format:"俱乐部: %@", model.orgName) as String
        self.orgLabel.text=NSString(format:"orgID: %@", model.orgid) as String
        self.groupLabel.text=NSString(format:"group: %@", model.groupid) as String
        self.userLabel.text=NSString(format:"user: %@", model.userid) as String

    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
