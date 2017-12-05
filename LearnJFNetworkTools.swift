//
//  LearnJFNetworkTools.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/23.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class JFNetworkTools: NSObject {
    
    // 网络请求回调闭包
    // success: 是否成功 flag: 预留参数 result: 字典数据 error: 错误消息
    typealias NetworkFinished = (_ success: Bool, _result: JSON?, _ error: NSError?) -> ()
    static let shareNetworkTools = JFNetworkTools()
}

// MRAK: - 基础请求方法
extension JFNetworkTools {
    
    /**
    GET请求
    
     - URLString: urlString
     - parameters: 参数
     - finished:   完成回调
    */
    func get(_ APIString: String, parameters: [String: Any]?, finished: @escaping NetworkFinished) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        print("APIString = \(APIString)")
        Alamofire.request(APIString, method: .get, parameters: parameters, headers: nil).responseJSON { (response) in
            self.handler(response: response, finished: finished)
        }
    }
    
    /**
    POST请求
     URLString: urlString
     parameters: 参数
     finished: 完成回调
    */
    func post(_APIString: String, parameters: [String : Any]?, finished: @escaping NetworkFinished) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        print("APIString = \(APIString)")
        Alamofire.request(APIString, method: .post, parameters: parameters, headers: nil).responseJSON { (response) in
            self.handle(response: response, finished: finished)
        }
    }
    
    // 处理响应结果
    // response: 响应对象
    // finished: 完成回调
    fileprivate func handle(response: DataResponse<Any>, finished: @escaping NewworkFinished) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        switch response.result {
        case .success(let value):
            print(value)
            // 解析json数据
            let json = JSON(value)
            finished(true, json, nil)
        
        case .failure(let error):
            finished(false, nil, error as NSError?)
        }
    }
}

extension JFNetworkTools {
    
    /**
    检测壁纸保存状态
    */
    
    func checkSaveState(_ finished: @escaping (_ on: Bool) -> ()) {
        
        get(CHECK_SAVE_STATUS, parameters: nil) { (success, json, error) in
            if success {
                if (json?["data"]["content"].stringValue == "1") {
                    finished(true)
                } else {
                    finished(false)
                }
            } else {
                
            }
        }
    }
}
