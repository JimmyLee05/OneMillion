//
//  LearnPopularViewController.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/24.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import UIKit
import MJRefresh
import YYWebImage

class JFPopularViewController: UIViewController {
    
    // 分类id为0会根据浏览量倒序查询
    var category_id = 0
    
    let wallpaperIdentifier = "wallpaperCell"
    
    // 分类标题
    var category_title = ""
    
    // 当前页
    var currentPage = 1
    
    // 壁纸模型数组
    var wallpaperArray = [JFWallPaperModel]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        
        // 配置上下拉刷新控件
        collectionView.mj_header = jf_setupHeaderRefresh(self, action: #selector(pulldownLoadData))
        collectionView.mj_footer = jf_setupFooterRefresh(self, action: #selector(pullupLoadData))
        
        collectionView.mj_header.beginRefreshing()
    }
    
    overrider func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = false
        
        // 分类则添加自定义导航栏
        if (category_id != 0) {
            view.addSubview(topView)
        }
    }
    
    /**
     准备视图
    */
    fileprivate func prepareUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
    }
    
    /**
     下拉加载最新
    */
    @objc fileprivate func pulldownLoadData() {
        currentPage = 1
        loadData(category_id, page: currentPage, method: .pullDown)
    }
    
    /**
     上拉加载更多
    */
    @objc fileprivate func pullupLoadData() {
        currentPage += 1
        loadData(category_id, page: currentPage, method: .pullUp)
    }
    
    /**
     加载壁纸数据
    */
    fileprivate func loadData(_ category_id: Int, page: Int, method: PullMethod) {
        
        JFWallPaperModel.loadWallpapersFromNetwork(category_id, page: page) { (wallpaperArray, error) in
            
            self
        }
    }
}



























