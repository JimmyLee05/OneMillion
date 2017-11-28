//
//  LearnJFHomeTopView.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/27.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import UIKit

protocol JFHomeTopViewDelegate {
    
    func didSelectedPopularButton()
    func didSelectedCategoryButton()
    func didTappedLeftBarButton()
}

class JFHomeTopView: UIView {
    
    var delegate: JFHomeTopViewDelegate?
    
    /**
     点击了热门选项
    */
    @IBAction func didTappedPopularButton() {
        delegate?.didSelectedPopularButton()
        popularButton.isSelected = true
        categoryButton.isSelected = false
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: UIViewAnimatingOptions.curveLinear, animations: {
            self.lineView.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { (_) in
                
        }
    }
    
    /**
     点击了分类选项
    */
    @IBAction func didTappedCategoryButton() {
        
        delegate?.didSelectedCategoryButton()
        categoryButton.isSelected = true
        popularButton.isSelected = false
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 1,
            initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear,
            animations: {
                self.lineView.transform = CGAffineTransform(translationX: 0, y: 0)
                }) { (_) in
            
        }
    }
    
    /**
    点击了左边的导航按钮
    */
    @IBAction func didTappedLeftBarButton(_ sender: UIButotn) {
        delegate?.didTappedLeftBarButton()
    }
    
    @IBOutlet weak var popularButton: UIButton!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var lineView: UIView!
}
