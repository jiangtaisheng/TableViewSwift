//
//  ClubViewController.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/18.
//  Copyright © 2016年 apple2015. All rights reserved.
//

import UIKit

class ClubViewController: TSBaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    var dataSouce:NSMutableArray = NSMutableArray.init(capacity: 0)
    var tableView:UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title="SWIFT.TaleView"
        self.loadData()
        self.creatTableView()
        
    }
    
    func creatTableView()
    {
    
        self.tableView=UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        self.view.addSubview(self.tableView)
        
    
    
    }
    
    
    func loadData(){
    
        let path:String = NSBundle.mainBundle().pathForResource("test", ofType:"plist")!
        let array:NSArray = NSArray(contentsOfFile: path)!
    
        print("%@",array)
        let num:Int = array.count-1
        for i in 0...num
        {
            let dic:NSDictionary = array[i] as! NSDictionary
         
            let model:ClubModel = ClubModel()
            model.orgAvatar=dic["orgAvatar"] as! String
            model.orgName=dic["orgName"] as! String
            model.orgid = dic["orgid"]! as! NSNumber
            model.userid = (dic["userid"]?.stringValue)!;
            model.groupid = dic["groupid"] as!String
            model.groupidd = model.groupid
//            model.orgid = NSString(format:"%d",(dic["orgid"]?.integerValue)!) as String
//            model.orgid = (dic["orgid"]?.stringValue)!;

            self.dataSouce.addObject(model)
            
           
        }
        
    }

    

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  self.dataSouce.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = ClubCell.cellWithTableView(tableView) as!ClubCell
        let model :ClubModel = self.dataSouce[indexPath.row] as! ClubModel
        cell.config(model)
        
        return cell
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 55.0
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let model:ClubModel = self.dataSouce[indexPath.row] as! ClubModel
        
        let vc:ClubDetailController = ClubDetailController()
        vc.model = model
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


class ClubCell:UITableViewCell {


    var  headView:UIImageView!
    var  nameLabel:UILabel!
    var  orgLabel:UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.createUI()
    }

    func createUI(){
    
        self.headView=UIImageView(frame: CGRectMake(12, 10, 30, 30))
        self.headView.layer.cornerRadius=15;
        self.headView.layer.masksToBounds=true
        self.contentView .addSubview(self.headView)

        
        self.nameLabel = UILabel(frame:CGRectMake(CGRectGetMaxX(self.headView.frame)+10, 10, 150, 30))
        self.nameLabel.textAlignment = NSTextAlignment.Left
        self.nameLabel.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(self.nameLabel)
        
        self.orgLabel = UILabel(frame:CGRectMake(UIScreen.mainScreen().bounds.size.width-120, 10, 100, 30))
        self.orgLabel.textAlignment = NSTextAlignment.Right
        self.orgLabel.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(self.orgLabel)
    
    }
    
    
    class  func  cellWithTableView(tableView:UITableView) ->AnyObject{
        let ID:String = "id";
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if (cell == nil)
        {
        
            cell = ClubCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ID)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
        }
        
        return cell!
    
    }
    
    
    func config(model:ClubModel){
        self.headView.sd_setImageWithURL(NSURL(string:model.orgAvatar), placeholderImage: UIImage(named: "head"))
        let org:NSNumber = model.orgid
        self.nameLabel.text=model.orgName
        self.orgLabel.text=org.stringValue
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}


