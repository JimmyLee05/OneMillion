extension HomeListView {
    
    /**
     * 添加箭头指示
     *
     **/
    func addArrowLayer() {
        if arrowLayer != nil ||
            !AppConfig.isShowedPairTipsArrow ||
            AppConfig.isShowedSplash {
            return
        }

        arrowLayer = AddMyntArrowLayer()
        arrowLayer?.position    = CGPoint(x: 30, y: -20)
        arrowLayer?.anchorPoint = CGPoint(x: 0.5, y: 0)
        viewController?.view.layer.addSublayer(arrowLayer!)
        arrowLayer?.runAnimation()
    }
    
    func removeArrowLayer() {
        arrowLayer?.removeAllAnimations()
        arrowLayer?.removeFromSuperlayer()
        arrowLayer = nil
    }
    
}

extension HomeListView {
    
    /**
     * 添加箭头指示
     *
     **/
    func addArrowLayer() {
        if arrowLayer != nil ||
            !AppConfig.isShowedPairTipsArrow ||
            AppConfig.isShowedSplash {
            return
        }

        arrowLayer = AddMyntArrowLayer()
        arrowLayer?.position    = CGPoint(x: 30, y: -20)
        arrowLayer?.anchorPoint = CGPoint(x: 0.5, y: 0)
        viewController?.view.layer.addSublayer(arrowLayer!)
        arrowLayer?.runAnimation()
    }

    func removeArrowLayer() {
        arrowLayer?.removeAllAnimations()
        arrowLayer?.removeFromSuperlayer()
        arrowLayer = nil
    }
}


