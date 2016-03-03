//
//  Error.swift
//  QBrickChinese
//
//  Created by 金飞 on 16/1/8.
//  Copyright © 2016年 Fei Jin. All rights reserved.
//

import UIKit

/// 这是我定义的一个通用结果类型
class Result: NSObject {
    var _excuteResult : Bool!
    var _resultData : NSObject!
    var _resultMsg : String!
    
    override init() {
        super.init()
        
    }
}
