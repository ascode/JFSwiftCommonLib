//
//  Error.swift
//  QBrickChinese
//
//  Created by 金飞 on 16/1/8.
//  Copyright © 2016年 Fei Jin. All rights reserved.
//

import UIKit

/// 这是我定义的一个通用结果类型
public class Result: NSObject {
    public var _excuteResult : Bool!
    public var _resultData : NSObject!
    public var _resultMsg : String!
    
    public override init() {
        super.init()
        
    }
}
