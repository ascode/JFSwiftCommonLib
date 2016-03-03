//
//  BaiduRestTTS.swift
//  QBrickChinese
//
//  Created by 金飞 on 15/12/26.
//  Copyright © 2015年 Fei Jin. All rights reserved.
//

import UIKit

/// 这个类用来封装百度语音合成RestApi的使用
class BaiduRESTTTS: NSObject {
    var _grant_type : String = "client_credentials"
    var _client_id : String = "tvSQAmNW3ka2IFlkDCYlbCMG"
    var _client_secret : String = "2c289b2656bc5859d0100fd27f5a8762"
    
    
    internal typealias dispatch_block_t = @convention(block) (data:NSData) -> Void
    
    internal typealias dispatch_block_receiveallsentence = @convention(block) (data:NSMutableData) -> Void
    
    
    
    func getVoiceAsyncByBaiduRestAPI(sentence : String , character : String , spd : String = "5" , block : dispatch_block_t){
        let urlForAccessToken = NSURL(string: "https://openapi.baidu.com/oauth/2.0/token?grant_type=\(self._grant_type)&client_id=\(self._client_id)&client_secret=\(self._client_secret)")
        if let theurl = urlForAccessToken {
            NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: theurl) , queue: NSOperationQueue()) { (res:NSURLResponse?, data:NSData?, err:NSError?) -> Void in

                let arrdata:AnyObject?
                
                guard let voiceData = data else{
                    return
                }
                
                do{
                    try arrdata = NSJSONSerialization.JSONObjectWithData(NSData(data: voiceData), options: NSJSONReadingOptions.AllowFragments)
                    let access_token = arrdata?.objectForKey("access_token")! as! String

                    let urlForVoiceTest = NSURL(string: "http://tsn.baidu.com/text2audio?tex=\(sentence)&lan=zh&cuid=jinfei&ctp=1&tok=\(access_token)&per=\(character)&spd=\(spd)&vol=9")

                    guard let urlForVoice : NSURL = urlForVoiceTest else{
                        return
                    }
                    
                    NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: urlForVoice) , queue: NSOperationQueue()) { (res:NSURLResponse?, data:NSData?, err:NSError?) -> Void in
                        
                        if let resData = data{
                            block(data: resData)
                        }
                    }

                }catch{
                    print("没有获取到网络数据")
                }
                
            }
        }
    }
    
    func getVoiceByBaiduRestAPI(sentence : String , character : String , spd : String, block : dispatch_block_t){
        let urlForAccessToken = NSURL(string: "https://openapi.baidu.com/oauth/2.0/token?grant_type=\(self._grant_type)&client_id=\(self._client_id)&client_secret=\(self._client_secret)")
        if let theurl = urlForAccessToken {
            do {
                let data = try NSURLConnection.sendSynchronousRequest(NSURLRequest(URL: theurl), returningResponse: nil)
                
                let arrdata:AnyObject?
                
                let voiceData = data
                
                do{
                    try arrdata = NSJSONSerialization.JSONObjectWithData(NSData(data: voiceData), options: NSJSONReadingOptions.AllowFragments)
                    let access_token = arrdata?.objectForKey("access_token")! as! String
                    
                    let urlForVoiceTest = NSURL(string: "http://tsn.baidu.com/text2audio?tex=\(sentence)&lan=zh&cuid=jinfei&ctp=1&tok=\(access_token)&per=\(character)&spd=\(spd)&vol=9")
                    
                    guard let urlForVoice : NSURL = urlForVoiceTest else{
                        //print("语音引擎不存在")
                        return
                    }
                    
                    do {
                        let resData = try NSURLConnection.sendSynchronousRequest(NSURLRequest(URL: urlForVoice), returningResponse: nil)
                        
                        
                        block(data: resData)
                    }catch let err as NSError {
                        print(err.localizedDescription)
                    }
                    
                    
                    
                }catch{
                    print("没有获取到网络数据")
                }
            }catch let err as NSError {
                print(err.localizedDescription)
            }
        }
    }
    
    
    func getDialogByBaiduRestAPI (dialog : [NSMutableArray] ,spd : String, block : dispatch_block_receiveallsentence) {
        dispatch_async(dispatch_get_global_queue(0,0)) { () -> Void in
            let allSentence : NSMutableData = NSMutableData()
            for(var j = 0 ; j < dialog.count ; j++){
                
                for (var i = 0 ; i < dialog[j].count ; i++ ) {
                    if((dialog[j][i].valueForKey("Language") as! String) == "Chinese"){
                        let selectedChineseSentence = dialog[j].objectAtIndex(i)
                        
                        //获取要阅读的句子和人物角色
                        let sentence = (selectedChineseSentence.valueForKey("Sentence") as! String).stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
                        var character = selectedChineseSentence.valueForKey("Character") as! String
                        
                        let sex = String(selectedChineseSentence.valueForKey("sd_character_sex")!)
                        //                    print(character)
                        //                    print(sex)
                        if(sex == "男"){
                            character = "1"
                        }else if (sex == "女"){
                            character = "0"
                        }else if( character == "B"){
                            character = "1"
                        }else{
                            character = "0"
                        }
                        
                        
                        //print("下载了一句")
                        //使用百度语音合成处理类获取读音
                        let baiduTTS : BaiduRESTTTS = BaiduRESTTTS()
                        baiduTTS.getVoiceByBaiduRestAPI(sentence, character: character,spd: spd) { (data) -> Void in
                            allSentence.appendData(data)
                            
                            
                            //self._readSource = "allsentence"
                        }
                    }
                }
                
            }
            block(data: allSentence)
        }
        
    }
}
