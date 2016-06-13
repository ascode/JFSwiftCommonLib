//
//  Device.swift
//  QBrickChinese
//
//  Created by 金飞 on 16/6/6.
//  Copyright © 2016年 Fei Jin. All rights reserved.
//

import Foundation

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



public enum DeviceModel : String {
    case Simulator = "Simulator/Sandbox",
    iPod1          = "iPod 1",
    iPod2          = "iPod 2",
    iPod3          = "iPod 3",
    iPod4          = "iPod 4",
    iPod5          = "iPod 5",
    iPad2          = "iPad 2",
    iPad3          = "iPad 3",
    iPad4          = "iPad 4",
    iPhone4        = "iPhone 4",
    iPhone4S       = "iPhone 4S",
    iPhone5        = "iPhone 5",
    iPhone5S       = "iPhone 5S",
    iPhone5C       = "iPhone 5C",
    iPadMini1      = "iPad Mini 1",
    iPadMini2      = "iPad Mini 2",
    iPadMini3      = "iPad Mini 3",
    iPadAir1       = "iPad Air 1",
    iPadAir2       = "iPad Air 2",
    iPhone6        = "iPhone 6",
    iPhone6plus    = "iPhone 6 Plus",
    iPhone6S       = "iPhone 6S",
    iPhone6Splus   = "iPhone 6S Plus",
    iPadPro9_7     = "iPadPro 9.7inch",
    Unrecognized   = "?unrecognized?"
}

extension UIDevice{
    
    public var deviceModel: DeviceModel{
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafeMutablePointer(&systemInfo.machine) {
            ptr in String.fromCString(UnsafePointer<CChar>(ptr))
        }
        var modelMap : [ String : DeviceModel ] = [
            "i386"      : .Simulator,
            "x86_64"    : .Simulator,
            "iPod1,1"   : .iPod1,
            "iPod2,1"   : .iPod2,
            "iPod3,1"   : .iPod3,
            "iPod4,1"   : .iPod4,
            "iPod5,1"   : .iPod5,
            "iPad2,1"   : .iPad2,
            "iPad2,2"   : .iPad2,
            "iPad2,3"   : .iPad2,
            "iPad2,4"   : .iPad2,
            "iPad2,5"   : .iPadMini1,
            "iPad2,6"   : .iPadMini1,
            "iPad2,7"   : .iPadMini1,
            "iPhone3,1" : .iPhone4,
            "iPhone3,2" : .iPhone4,
            "iPhone3,3" : .iPhone4,
            "iPhone4,1" : .iPhone4S,
            "iPhone5,1" : .iPhone5,
            "iPhone5,2" : .iPhone5,
            "iPhone5,3" : .iPhone5C,
            "iPhone5,4" : .iPhone5C,
            "iPad3,1"   : .iPad3,
            "iPad3,2"   : .iPad3,
            "iPad3,3"   : .iPad3,
            "iPad3,4"   : .iPad4,
            "iPad3,5"   : .iPad4,
            "iPad3,6"   : .iPad4,
            "iPhone6,1" : .iPhone5S,
            "iPhone6,2" : .iPhone5S,
            "iPad4,1"   : .iPadAir1,
            "iPad4,2"   : .iPadAir2,
            "iPad4,4"   : .iPadMini2,
            "iPad4,5"   : .iPadMini2,
            "iPad4,6"   : .iPadMini2,
            "iPad4,7"   : .iPadMini3,
            "iPad4,8"   : .iPadMini3,
            "iPad4,9"   : .iPadMini3,
            "iPhone7,1" : .iPhone6plus,
            "iPhone7,2" : .iPhone6,
            "iPhone8,1" : .iPhone6S,
            "iPhone8,2" : .iPhone6Splus,
            "iPad6,3"   : .iPadPro9_7
        ]
        
        if let model = modelMap[String.fromCString(modelCode!)!] {
            return model
        }
        
        return DeviceModel.Unrecognized
    }
}