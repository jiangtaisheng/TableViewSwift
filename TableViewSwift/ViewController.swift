//
//  ViewController.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/16.
//  Copyright © 2016年 apple2015. All rights reserved.
//

import UIKit

class ViewController: TSBaseViewController,UITableViewDelegate,UITableViewDataSource,TSStylpCellDelegate {

    var  myTableView :UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="SWIFT"
        
        self.view.backgroundColor=UIColor.orangeColor()
       self.myTableView = UITableView(frame: CGRectMake(0, 0, UIScreen .mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height), style: UITableViewStyle.Plain)
        self.view.addSubview(self.myTableView )
        self.myTableView .delegate = self
        self.myTableView .dataSource = self
        self.myTableView .backgroundColor = UIColor.whiteColor()
        
//        print("++++++++++++++%@------------------%d",self.navigationController!.viewControllers,self.navigationController!.viewControllers.count)
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2;
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        if(indexPath.row<2){
            
            var  cell =  tableView.dequeueReusableCellWithIdentifier("diy_cell")
            
            if((cell) == nil){
                
                cell  = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "diy_cell")
            }
            
            
            cell!.textLabel?.text = "MyFirstSwift"
            cell!.detailTextLabel?.text = "gaga"
            let str="http://img.xunbao178.com/download/appavatar/20160506/o_2200472634_1382105_j1v6e9_100_100.jpg"
            cell!.imageView?.sd_setImageWithURL(NSURL(string: str), placeholderImage:UIImage(named:"head@2x.png"))
            
            return cell!
        }else if(indexPath.row<4)
        {
        
            var  cell =  tableView.dequeueReusableCellWithIdentifier("id")
            
            if((cell) == nil){
                
                cell = DiyViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "id")
            }
            
            (cell as!DiyViewCell).title.text="1223"
            (cell as!DiyViewCell).clickBtn.setTitle("[" + "\(indexPath.row)" + "]", forState:UIControlState.Normal)
            return cell!;
        
        }else{
           
//            var  cell =  tableView.dequeueReusableCellWithIdentifier("IDD")
//            
//            if((cell) == nil){
//            
//               cell=TSStylpCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "IDD")
//            }
//            (cell as!TSStylpCell).delegate=self
            
            let  cell = TSStylpCell.cellWithTableView(tableView) as!TSStylpCell
            
            cell.delegate=self;

            let str="http://img.xunbao178.com/download/appavatar/20160506/o_2200472634_1382105_j1v6e9_100_100.jpg"

            cell.config(str, titleStr:"123", text: "789")
//            (cell as!TSStylpCell).headView!.sd_setImageWithURL(NSURL(string:str), placeholderImage: UIImage(named:"head@2x.png"))
//            (cell as!TSStylpCell).title.text="你好啊"
//            (cell as!TSStylpCell).clickBtn.setTitle("[" + "\(indexPath.row)" + "]", forState:UIControlState.Normal)

            return cell
        
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vcc:SwiftController = SwiftController()
        self.navigationController?.pushViewController(vcc, animated:true)
    }
    
    func changeData(item: AnyObject) {
        
        print("dfdfdfdf")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




class DiyViewCell: UITableViewCell {
    var title:UILabel!
    var clickBtn:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if self.isEqual(nil){return;}
        ///
        title = UILabel(frame: CGRectMake(20, 20, 200, 30));
        title.textColor = UIColor.redColor();
        self.contentView.addSubview(title!)
        clickBtn = UIButton(frame: CGRectMake(200, 20, 60, 30))
        //clickBtn.setTitle("app", forState: UIControlState.Normal)
        clickBtn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        clickBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        self.contentView.addSubview(clickBtn!)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}