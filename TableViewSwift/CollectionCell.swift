//
//  CollectionCell.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/19.
//  Copyright © 2016年 apple2015. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    
    
    var  headView:UIImageView!
    var  nameLabel:UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor=UIColor.whiteColor()

        self.createUI()
    }
    
    
    func createUI(){
        self.contentView.backgroundColor=UIColor.whiteColor()
        self.headView=UIImageView(frame: CGRectMake(0, 0, 80, 60))
//        self.headView.layer.cornerRadius=15;
//        self.headView.layer.masksToBounds=true
        self.contentView .addSubview(self.headView)
        
        
        self.nameLabel = UILabel(frame:CGRectMake(0,CGRectGetMaxY(self.headView.frame), 80, 20))
        self.nameLabel.textAlignment = NSTextAlignment.Center
        self.nameLabel.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(self.nameLabel)
        
    }
    
    
    
    
    func config(model:ClubModel){
        
        
        self.headView.sd_setImageWithURL(NSURL(string:model.orgAvatar), placeholderImage: UIImage(named: "head"))
        
        self.nameLabel.text=model.orgName
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    


}
