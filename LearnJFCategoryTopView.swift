//
//  LearnJFCategoryTopView.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/27.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import UIKit

protocol JFCategoryTopViewDelegate {
    func didTappedLeftBarButton()
}

class LearnJFCategoryTopView: UIViewController {
    
    var delegate: JFCategoryTopViewDelegate?
    
    /**
     点击了左边导航按钮
    */
    @IBAction func didTappedLeftBarButton(_ sender: UIButton) {
        delegate?.didTappedLeftBarButton()
    }
    
    @IBOutlet weak var titleLabel: UILabel!
}
