//
//  LearnApi.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/21.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import Foundation

//api根路径 http://jiansan.6ag.cn
let LBASE_URL = "http://jiansan.6ag.cn"

//提交
let LSUBMIT_FEEDBACK = "\(BASE_URL)/api/feedback"

//获取分类列表
let LGET_CATEGORIES = "\(BASE_URL)/api/status"

//检测壁纸保存状态
let LCHECK_SAVE_STATUS = "\(BASE_URL)/api/status"

/**
  根据分类ID获取壁纸列表
 
 - parameter category_id: 分类id
 - returns: 返回 api接口
 */

func GET_WALLPAPERS(_ category_id: Int) -> String {
    
    return "\(BASE_URL)/api/wallpapers/\(category_id)";
}

/**
 根据壁纸id获取壁纸信息
 
 - parameter id : 壁纸id
 - returns: 返回api接口
 */

func GET_SHOW_WALLPAPER(_ id: Int) -> String {
    return "\(BASE_URL)/api/show/\(id)"
}