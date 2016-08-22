//
//  ClubModel.swift
//  TableViewSwift
//
//  Created by apple2015 on 16/8/18.
//  Copyright © 2016年 apple2015. All rights reserved.
//

import UIKit

class ClubModel: NSObject {

    var orgName: String = ""
    var orgAvatar: String = ""
    var orgid: NSNumber = 0.0
    var tagid: NSNumber = 0.0
    var userid: String = ""{
    
        //  给 userid 赋值  类似重写set方法

            willSet{
    
                print("将要设置新值\(newValue)")
    
            }
            didSet{
                let count : Int = userid.characters.count-1
                let str :NSString = (userid as NSString).substringFromIndex(count)
                if str.isEqual("9"){
                
                   userid = "hi"
                 
                }
            }
    
    }
    var groupid: String = ""
    
    
  //增加一个变量  给 groupid 赋值  类似重写set方法
    var groupidd: String  {
    
        get{
            
           return self.groupid
        }
        
        set(newValue){
        
            let count : Int = newValue.characters.count-1
            let str :NSString = (newValue as NSString).substringFromIndex(count)
            if str.isEqual("8"){
            
              self.groupid = "hello"
             
            }else{
            
                self.groupid = newValue

            }
            
        }

    }

    
 
    
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        
    }
  
}
