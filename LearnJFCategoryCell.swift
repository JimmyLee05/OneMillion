//
//  LearnJFCategoryCell.swift
//  JianSanWallpaper
//
//  Created by 李南君 on 2017/11/27.
//  Copyright © 2017年 六阿哥. All rights reserved.
//

import UIKit

class JFCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    var model: JFCategoryModel? {
        didSet {
            categoryImageView.image = UIImage(named: "category_\(model?.alias ?? "")")?.redrawImage(size: categoryImageView.bounds.size)
        }
    }
    
}
