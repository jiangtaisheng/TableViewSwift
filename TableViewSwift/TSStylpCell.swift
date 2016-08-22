//
//  TSStylpCell.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/17.
//  Copyright © 2016年 apple2015. All rights reserved.
//

//import Cocoa
import UIKit
protocol TSStylpCellDelegate {
    func changeData(item:AnyObject)
}

class TSStylpCell: UITableViewCell {
    var title:UILabel!
    var clickBtn:UIButton!
    var headView:UIImageView!
    var delegate :TSStylpCellDelegate?
    
 
    
    class func cellWithTableView (tableView:UITableView) ->AnyObject{
        
      let ID:String="TSStylpCell"
       var  cell = tableView.dequeueReusableCellWithIdentifier(ID)
    
        if cell==nil{
        
          cell =  TSStylpCell.init(style: UITableViewCellStyle.Default, reuseIdentifier:ID)

        }
       
    
       return (cell as! TSStylpCell)
    }
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if self.isEqual(nil){return;}
        
        self.createUI()
    }

    func createUI(){
    
        
        headView=UIImageView(frame: CGRectMake(10, 10, 30, 30))
        headView.layer.cornerRadius=15
        headView.layer.masksToBounds=true
        
        self.contentView.addSubview(headView!)
        
        title = UILabel(frame: CGRectMake(60, 20, 200, 30));
        title.textColor = UIColor.redColor();
        
        self.contentView.addSubview(title!)
        clickBtn = UIButton(frame: CGRectMake(200, 20, 60, 30))
        clickBtn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        clickBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        clickBtn .addTarget(self,action: "onClickBtnd:", forControlEvents:UIControlEvents.TouchUpInside)
        
        self.contentView.addSubview(clickBtn!)

    
    }
  
    func onClickBtnd(btn:UIButton){
        
        print("gotot")
        
        self.delegate?.changeData("123456")
        
    }
    
    func config(url:String,titleStr:String,text:String){
    
        headView.sd_setImageWithURL(NSURL(string: url), placeholderImage:UIImage(named: "head"))
        title.text=text;
        clickBtn .setTitle(titleStr, forState: UIControlState.Normal)
        
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}
