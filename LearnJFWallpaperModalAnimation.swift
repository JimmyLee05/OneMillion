//
//  LearnJFWallpaperModalAnimation.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/23.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import UIKit

class JFWallpaperModalAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        presentedView?.frame = SCREEN_BOUNDS
    }
}
