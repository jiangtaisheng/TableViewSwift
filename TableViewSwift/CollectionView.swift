//
//  CollectionView.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/19.
//  Copyright © 2016年 apple2015. All rights reserved.
//

import UIKit

class CollectionView: TSBaseViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var dataSouce:NSMutableArray = NSMutableArray.init(capacity: 0)
    var collectionView :UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="SWIFT.CollectionView"
        self.view.backgroundColor = UIColor.whiteColor()
        self.createCollectionView()
        self.loadData()
        
    }
    func loadData(){
        
        let path:String = NSBundle.mainBundle().pathForResource("test", ofType:"plist")!
        let array:NSArray = NSArray(contentsOfFile: path)!
        
        let num:Int = array.count-1
        var  j: Int = 0
        for ( ;j<4;j++){
            
            for i in 0...num
            {
                let dic:NSDictionary = array[i] as! NSDictionary
                var model:ClubModel = ClubModel()
//                model.orgAvatar=dic["orgAvatar"] as! String
//                model.orgName=dic["orgName"] as! String
//                model.setValuesForKeysWithDictionary(dic as! [String : AnyObject])
                 //MJExtension
                  model = model.mj_setKeyValues(dic)
                self.dataSouce.addObject(model)
            }
        }
        
        self.collectionView.reloadData()
    }

    func createCollectionView(){
    
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.itemSize=CGSizeMake(80, 80)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout:layout)
        self.collectionView.delegate=self
        self.collectionView.dataSource=self
        self.collectionView .registerClass(CollectionCell.self, forCellWithReuseIdentifier: "IDD")
        self.view.addSubview(self.collectionView)
    
    
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : CollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("IDD", forIndexPath: indexPath) as!CollectionCell
        
        let model:ClubModel = self.dataSouce[indexPath.row] as! ClubModel
        cell.config(model)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let  vc : PicDisplayController = PicDisplayController.init()
        vc.dataArray = NSArray.init(array: self.dataSouce)
        vc.index = indexPath.row
        self.navigationController!.pushViewController(vc, animated: true)
        
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return  self.dataSouce.count
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
