//
//  LearnJFSideButton.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/28.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import UIKit

class LearnJFSideButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = CGRect(x: 33, y: 0, width: 22, height: 22)
        titleLabel?.frame = CGRect(x: 0, y: 27, width: 86, height: 20)
        titleLabel?.textAlignment = .center
    }
}
