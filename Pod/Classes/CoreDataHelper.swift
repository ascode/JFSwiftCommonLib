//
//  CoreDataHelper.swift
//  Pods
//
//  Created by 金飞 on 16/3/17.
//
//

import UIKit
import CoreData

public class CoreDataHelper: NSObject {
    
    var contextCoredata : NSManagedObjectContext!
    
    public init(initContextCoredata : NSManagedObjectContext) {
        self.contextCoredata = initContextCoredata
    }

    /// 根据指定的实体的指定id判断是否存在数据
    public func isExistsIDInCoreData(id : String , entityName : String) -> Bool{
        let f = NSFetchRequest(entityName: entityName)
        f.predicate = NSPredicate(format: "id = " + id, argumentArray: nil)
        do{
            let returnArray = try contextCoredata.executeFetchRequest(f)
            if(returnArray.count > 0){
                return true
            }else{
                return false
            }
        }catch let err as NSError{
            print(err)
            return false
        }
    }
    
    /// 根据指定的查询表达式在指定实体中判断是否存在数据
    public func isExistsByFormatInCoreData(format : String , entityName : String) -> Bool{
        let f = NSFetchRequest(entityName: entityName)
        f.predicate = NSPredicate(format: format, argumentArray: nil)
        do{
            let returnArray = try contextCoredata.executeFetchRequest(f)
            if(returnArray.count > 0){
                return true
            }else{
                return false
            }
        }catch let err as NSError{
            print(err)
            return false
        }
    }
}
