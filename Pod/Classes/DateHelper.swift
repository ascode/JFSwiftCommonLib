//
//  DateHelper.swift
//  QBrickChinese
//
//  Created by 金飞 on 16/1/30.
//  Copyright © 2016年 Fei Jin. All rights reserved.
//

import UIKit

public class DateHelper: NSObject {
    
    
    public func timeStampString(timeStamp: Double!) -> String {
        let newDate = NSDate(timeIntervalSince1970:timeStamp)
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm:ss.SSS"
        return formatter.stringFromDate(newDate)
    }
}
