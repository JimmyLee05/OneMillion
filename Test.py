 fileprivate func _initInfoView() {
        /* 添加箭头茅点 */
        arrowImageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        /* 初始化手势 */
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didClickInfoView))
        infoView.addGestureRecognizer(tapGestureRecognizer)
    }

fileprivate func _initInfoView() {
        /* 添加箭头茅点 */
        arrowImageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        /* 初始化手势 */
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didClickInfoView))
        infoView.addGestureRecognizer(tapGestureRecognizer)
}

albumView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didClickEditThumb(tapGestureRecognizer:))))

albumView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didClickEditThumb(tapGestureRecognizer:)))