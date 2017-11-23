//
//  LearnJFWallpaperDismissAnimation.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/23.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import UIKit

class JFWallpaperDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    // 动画时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    // dismiss动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // 获取到 modal出来的控制器的view
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        
        UIApplication.shared.isStatusBarHidden = false
        
        // 动画收起 modal出来的控制器view
        UIView.animate(withDuration: transitionDuration(using: nil), animations: {
            fromView.transform = CGAffineTransform(transitioX: 0, y: SCREEN_HEIGHT)
            fromView.alpha = 0
        }, completion: { (_) in
            transitionContext.completeTransition(true)
        })
    }
}
