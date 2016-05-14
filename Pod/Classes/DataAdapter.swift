//
//  DataAdapter.swift
//  QBrickChinese
//
//  Created by 金飞 on 15/12/23.
//  Copyright © 2015年 Fei Jin. All rights reserved.
//

import UIKit

/// 这个累类用来处理存储的数据模型到内存或者展示界面的数据模型的相互转化，比如数据分组，一位数组转变成二维数组
public class DataAdapter: NSObject {
    public static func TransLinearArrayGroupedToTwoDdimensionalArrayByMedia(linearArray : NSArray) -> [NSMutableArray]{
        /// 这个变量是处理后的二位数组变量，最终按照media字段将数据进行分组
        var resultJsonData = [NSMutableArray]()
        for (var i = 0 ; i < linearArray.count ; i++ ){
            var hasSameMedia : Bool = false
            for(var j = 0 ; j < resultJsonData.count ; j++ ){
                //print("------\(linearArray.objectAtIndex(i).valueForKey("media")!)")
                //print("------\(linearArray.objectAtIndex(i).valueForKey("commerce_purpose"))")
                //print(resultJsonData[j][0])
                if(resultJsonData[j].count != 0 && (linearArray.objectAtIndex(i).valueForKey("media")! as! String) == (resultJsonData[j][0].valueForKey("media") as! String)){
                    hasSameMedia = true
                    //print(resultJsonData[j][0].valueForKey("media"))
                    resultJsonData[j].addObject(linearArray[i])
                    break
                    
                    
                }
            }
            if(!hasSameMedia){
                let newArray : NSMutableArray = NSMutableArray(array: [linearArray[i]])
                resultJsonData.append(newArray)
            }
        }
        
        return resultJsonData
    }
    
    public static func TransTwoDdimensionalArrayToLinearArray(twoDdimensionalArray : [NSArray]) -> NSArray{
        let resultJsonData = NSMutableArray()
        for(var i = 0 ; i < twoDdimensionalArray.count ; i++){
            for(var j = 0 ; j < twoDdimensionalArray[i].count ; j++){
                resultJsonData.addObject(twoDdimensionalArray[i][j])
            }
        }
        return resultJsonData
    }
    
}
