//
//  Text.swift
//  QBrickChinese
//
//  Created by 金飞 on 15/12/15.
//  Copyright © 2015年 Fei Jin. All rights reserved.
//

import UIKit

/// 这个类用来存储设备信息
public class DeviceInfo: NSObject {

    public enum ClientType {
        case ios
        case android
        case ie
        case chrome
        case firefox
    }
    
    /// 获取设备语言
    public static let CurrentLanguage = NSLocale.preferredLanguages()[0]
    
    /// 获取设备的自然语言
    public static func getCurrentLanguage() -> String{
        switch CurrentLanguage{
        case "zh-cn":
            return "English"
        case "zh-Hans-CN":
            return "English"
        case "en-JP":
            return "English"
        case "en-CN":
            return "English"
        case "en-US":
            return "English"
        case "ja-JP":
            return "Japanese"
        case "ja-US":
            return "Japanese"
        case "ja-CN":
            return "Japanese"
        default:
            return "English"
        }
    }
    
    

}