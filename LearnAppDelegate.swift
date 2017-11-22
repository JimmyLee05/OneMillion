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
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey  : Any] = [:]) -> Bool {
        let result = UMSocialManager.default().handleOpen(url)
        if result {
            
        }
        return result
    }
    
    // 初始化广告管理选项
    fileprivate func setupADManager() {
        JFAdConfiguration.shared.config(
            applicationId: "ca-app-pub-3941303619697740~9852864912",
            interstitialId: "ca-app-pub-3941303619697740/9066705318",
            bannerId: "ca-app-pub-3941303619697740/2329598119",
            timeInterval: 120)
    }
    
    /**
    配置保存壁纸选项
    */
    fileprivate func setupSaveWallPaper() {
        JFNetworkTools.shareNetworkTools.checkSaveState { (on) in
            self.on = on
            JFWallPaperTool.shareInstance().on = on
        }
    }
    
    /**
    配置全局样式
    */
    fileprivate func setupGlobalStyle() {
       
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }
        UIScrollView.appearance().alwaysBounceVertical = true
        UITableView.appearance().estimatedRowHeight = 0
        UITableView.appearance().estimatedSectionHeaderHeight = 0
        UITableView.appearance().estimatedSectionFooterHeight = 0
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        JFProgressHUD.setupHUD()
    }
    
    /**
    加载默认根控制器
    */
    fileprivate func loadViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = JFNavigationController(rootViewController: JFHomeViewController())
        window?.makeKeyAndVisible()
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return true
    }
}
