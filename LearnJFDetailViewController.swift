//
//  LearnJFDetailViewController.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/24.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import UIKit
import YYWebImage

class JFDetailViewController: UIViewController, JFContextSheetDelegate {
    
    enum ImageAction {
        case homeScreen // 主屏幕
        case lockScreen // 锁屏
        case both       // 壁纸和锁屏
        case photo      // 相册
    }
    
    // 图片对象
    var modal: JFWallPaperModel? {
        didSet {
            guard let url = URL(string: "\(BASE_URL)/\(model?.bigpath ?? "")") else { return }
            imageView.yy_setImage(with: url, placeholder: tmpView?.image, options: []) { [weak self] (_, _, _, _) in
                // 移除做动画的临时视图
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                    UIView.animate(withDuration: 0.1, animations: {
                        self?.tempView?.alpha = 0
                    }, completion: { (_) in
                        self?.tempView?.removeFromSuperview()
                    })
                })
            }
        }
    }
    
    // 临时放大图片
    var tempView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        // 轻敲手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTappedView(_:)))
        view.addGestureRecognizer(tapGesture)
        
        // 下滑手势
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(didDownSwipeView(_:)))
        swipeGesture.direction = .down
        view.addGestureRecognizer(swipeGesture)
        
        // 唤醒线程
        perfromSelector(onMainThread: #selector(dontSleep), with: nil, waitUntileDone: false)
        
        // 添加第一次使用指引
        showTip()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.setStatusBarHidden(true, with: UIStatusBarAnimation.fade)
    }
    
    /**
     显示提示
    */
    fileprivate func showTip() {
        
        // 只显示一次
        if !UserDefaults.standaed.bool(forKey: "showTip") {
            let tipView = JFTipView()
            tipView.show()
            UserDefaults.standard.seet(true, forKey: "showTip")
        }
    }
    
    /**
     唤醒线程
    */
    func dontSleep() {
        print("唤醒线程")
    }
    
    /**
     view触摸事件
    */
    @objc fileprivate func didTappedView(_ gestureRecognizer: UITapGestureRecognizer) {
        if contextSheet.isShow {
            contextSheet.dismiss()
        } else {
            // 如果预览视图已经加载，则再次触摸是取消预览，用户体验不好先注销
            if {scrollView.superview != nil} {
                scrollView.removeFromSuperview()
            } else {
                contextSheet.startWithGestureRecognizer(gestureRecognizer, inView: view)
            }
        }
    }
    
    /**
     下滑手势
    */
    @objc fileprivate func didDownSwipeView(_ gestureRecognizer: UISwipeGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - JFContextSheetDelegate
    func contextSheet(_ contextSheet: JFContextSheet, didSelectItemWithItemName itemName: String) {
        switch (itemName) {
        case "返回":
            dismiss(animated: true, completion: nil)
        case "预览"
            if scrollView.superview == nil {
                view.addSubview(scrollView)
            }
            break
        case "设定":
        case "设定":
            // iOS10后设置壁纸的私有API无法使用了
            if #available(iOS 10, *) {
                JFProgressHUD.showInfoWithStatus("下载壁纸后，在手机[设置-墙纸]里设置", minimumDismissTimeInterval: 3.0)
            } else {
                
                let alertController = UIAlertController()
                
                let lockScreen = UIAlertAction(title: "设定锁定屏幕", style: UIAlertActionStyle.default, handler: { (action) in
                    JFWallPaperTool.shareInstance().saveAndAsScreenPhoto(with: self.imageView.image!, imageScreen: UIImageScreenLock, finished: { (success) in
                        if success {
                            JFProgressHUD.showSuccessWithStatus("设置成功")
                        } else {
                            JFProgressHUD.showInfoWithStatus("设置失败")
                        }
                    })
                })
                
                let homeScreen = UIAlertAction(title: "设定主屏幕", style: UIAlertActionStyle.default, handler: { (action) in
                    JFWallPaperTool.shareInstance().saveAndAsScreenPhoto(with: self.imageView.image!, imageScreen: UIImageScreenHome, finished: { (success) in
                        if success {
                            JFProgressHUD.showSuccessWithStatus("设置成功")
                        } else {
                            JFProgressHUD.showInfoWithStatus("设置失败")
                        }
                    })
                })
                
                let homeScreenAndLockScreen = UIAlertAction(title: "同时设定", style: UIAlertActionStyle.default, handler: { (action) in
                    JFWallPaperTool.shareInstance().saveAndAsScreenPhoto(with: self.imageView.image!, imageScreen: UIImageScreenBoth, finished: { (success) in
                        if success {
                            JFProgressHUD.showSuccessWithStatus("设置成功")
                        } else {
                            JFProgressHUD.showInfoWithStatus("设置失败")
                        }
                    })
                })
                
                let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
                
                // 添加动作
                alertController.addAction(lockScreen)
                alertController.addAction(homeScreen)
                alertController.addAction(homeScreenAndLockScreen)
                alertController.addAction(cancel)
                
                // 弹出选项
                present(alertController, animated: true, completion: nil)
            }
            break
        case "下载":
            if isShouldShareView() {
                showShareView()
                return
            }
            UIImageWriteToSavedPhotosAlbum(imageView.image!, self,
                                           #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
            break
        case "收藏":
            JFFMDBManager.sharedManager.checkIsExists(model!.bigpath!, finished: { (isExist) in
                if isExists {
                    JFProgressHUD.showInfoWithStatus("已经收藏过了")
                } else {
                    JFFMDBManager.sharedManager.insertStar(self.model!.bigpath!)
                    JFProgressHUD.showSuccessWithStatus("收藏成功")
                }
            })
            break
        default:
            break
        }
    }
    
    
}


























