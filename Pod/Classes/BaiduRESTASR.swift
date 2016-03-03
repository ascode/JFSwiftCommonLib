//
//  BaiduRESTASR.swift
//  QBrickChinese
//
//  Created by 金飞 on 15/12/26.
//  Copyright © 2015年 Fei Jin. All rights reserved.
//

import UIKit

/// 这个类用来封装百度语音识别RestApi的使用
class BaiduRESTASR: NSObject {
    var _grant_type : String = "client_credentials"
    var _client_id : String = "tvSQAmNW3ka2IFlkDCYlbCMG"
    var _client_secret : String = "2c289b2656bc5859d0100fd27f5a8762"
    
    internal typealias dispatch_block_t = @convention(block) (strdata: String) -> Void
    
    func aa(audioData : NSData , block : dispatch_block_t){
        let urlForAccessToken = NSURL(string: "https://openapi.baidu.com/oauth/2.0/token?grant_type=\(self._grant_type)&client_id=\(self._client_id)&client_secret=\(self._client_secret)")
        if let theurl = urlForAccessToken {
            //从网络请求access_token
            NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: theurl) , queue: NSOperationQueue()) { (res:NSURLResponse?, data:NSData?, err:NSError?) -> Void in
                let arrdata:AnyObject?
                do{
                    try arrdata = NSJSONSerialization.JSONObjectWithData(NSData(data: data!), options: NSJSONReadingOptions.AllowFragments)
                    let access_token = arrdata?.objectForKey("access_token")! as! String //得到access_token
                    
                    let base64Data = audioData.base64EncodedDataWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)//将语音数据转换成base64编码数据
                    
                    
                    let urlRequest = NSMutableURLRequest(URL: NSURL(string: "http://vop.baidu.com/server_api?lan=zh&token=\(access_token)&cuid=jinfei")!)//配置url和控制信息
                    urlRequest.HTTPMethod = "POST"
                    urlRequest.setValue("audio/amr;rate=8000", forHTTPHeaderField: "Content-Type")//设置语音格式和采样率
                    urlRequest.setValue("\(audioData.length)", forHTTPHeaderField: "Content-length")//设置原始语音长度
                    
                    urlRequest.HTTPBody = base64Data //设置传送的语音数据
                    
                    NSURLConnection.sendAsynchronousRequest(urlRequest , queue: NSOperationQueue()) { (res:NSURLResponse?, data:NSData?, err:NSError?) -> Void in
                        
                        //print("语音解析结果:\(String(NSString(data: data!, encoding: NSUTF8StringEncoding)))")
                        
                        let strVideo = String(NSString(data: data!, encoding: NSUTF8StringEncoding))
                        
                        block(strdata: strVideo)
                        
                    }
                }catch{
                    print("没有获取到网络数据")
                }
                
            }
        }
    
    }
}
