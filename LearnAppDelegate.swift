//
//  LearnAppDelegate.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/21.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import UIKit

@UIApplicationMain
class LAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var on = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupGlobalStyle()              //设置全局样式
        loadViewController()            //加载视图控制器
        setupSaveWallPaper()            //设置保存壁纸
        checkShowShare()                //检查能否够显示分享
        setupUSharePlatforms()          //设置分享sdk
        setupMobClick()                 //设置友盟统计
        setupADManager()                //设置广告管理者
        
        return true
    }
    
    //检查能否需要弹出分享
    fileprivate func checkShowShare() {
        
        // 如果正在更新版本中，则隐藏功能
        JFAppStoreApp.getAppStoreApp { (app, isUpdatingVersion) in
            if let app = app {
                UserDefaults.standard.set(isUpdatingVersion, forKey: "isUpdatingVersion")
                print("app.version = \(app.version ?? "")")
            } else {
                // 请求出了问题，为了防止意外，也当成正在版本更新
                UserDefaults.standard.set(true, forKey: "isUpdatingVersion")
            }
        }
    }
    
    // 初始化友盟分享
    fileprivate func setupUSharePlatforms() {
        
        UMSocialManager.default().openLog(false)
        UMSocialGlobal.shareInstance().isUsingHttpsWhenShareContent = true
        
        // 设置友盟appKey
        UMSocialManager.default().umSocialAppkey = UM_APP_KEY
        
        // 微信聊天
        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatSession, appKey: WX_APP_ID, appSecret: WX_APP_SECRET, redirectURL: "http://mobile.umeng.com/social")
        
        // 微信收藏
        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatFavorite, appKey: WX_APP_ID, appSecret: WX_APP_SECRET, redirectURL: "http://mobile.umeng.com/social")
        
        // 微信朋友圈
        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatTimeLine, appKey: WX_APP_ID, appSecret: WX_APP_SECRET, redirectURL: "http://mobile.umeng.com/social")
        
        // 腾讯
        UMSocialManager.default().setPlaform(UMSocialPlatformType.QQ, appKey: QQ_APP_ID, appSecret: nil, redirectURL: "http://mobile.umeng.com/social")
        
        // 新浪
        UMSocialManager.default().setPlaform(UMSocialPlatformType.sina, appKey: WB_APP_KEY, appSecret: WB_APP_SECRET, redirectURL: "http://mobile.umeng.com/social")
    }
    
    // 初始化友盟统计
    fileprivate func setupMobClick() {
        let config = UMAnalyticsConfig.sharedInstance()
        config?.appKey = UM_APP_KEY
        config?.channelId = "App Store"
        let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        MobClick.setAppVersion(currentVersion)
        MobClick.start(withConfigure: config)
    }
    
    func application() -> Bool {
        
    }
    
    // 初始化广告管理选项
    fileprivate func setupADManager() {
        
    }
    
    /**
    配置保存壁纸选项
    */
    fileprivate func setupSaveWallPaper() {
        
    }
    
    /**
    配置全局样式
    */
    fileprivate func setupGlobalStyle() {
        
    }
    
    /**
    加载默认根控制器
    */
    fileprivate func loadViewController() {
        
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return true
    }
}





