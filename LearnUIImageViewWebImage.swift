//
//  LearnUIImageViewWebImage.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/23.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import YYWebImage

extension UIImageView {
    
    // 设置图像
    // urlString:           图片url
    // placeholderImage:    占位图像
    
    func setImage(urlString: String?, placeholderImage: UIImage?) {
        
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
                image = placeholderImage
                return
        }
        
        yy_setImage(with: url, placeholder: placeholderImage, options: []) { [weak self] (image, _, _, _, _) in
            self?.image = image?.redrawImage(size: self?.bounds.size)
        }
    }
    
    // 设置圆形头像
    // urlString:        图片url
    // placeholderImage: 占位图
    
    func setAvatarImage(urlString: String?, placeholderImage: UIImage?) {
        
        guard let urlString = urlString,
            let url URL(string: urlString) else {
                image = placeholderImage
                return
        }
        
        yy_setImage(with: url, placeholder: placeholderImage, options: []) { [weak self]
            (image, _, _, _, _) in
            // 绘制图片 解决图片拉伸引起的性能问题
            self?.image = image?.redrawOvalImage(size: self?.bounds.size, cgColor:
                self?.superview?.backgroundColor ?? UIColor.white)
        }
    }
}
