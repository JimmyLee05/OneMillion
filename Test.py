fileprivate func _initRipple(_ phoneImage: UIImage) {
        let count = 5
        let rippleWidth: CGFloat = phoneImage.size.width * 0.8
        for _ in 0..<count {
            let layer           = CAShapeLayer()
            layer.contentsScale = UIScreen.main.scale
            layer.bounds        = CGRect(x: 0, y: 0, width: rippleWidth, height: rippleWidth)
            layer.anchorPoint   = CGPoint(x: 0.5, y: 0.5)
            // 光圈颜色等待确定修改
            layer.strokeColor   = UIColor.lightGray.cgColor
            layer.fillColor     = UIColor.clear.cgColor
            layer.lineWidth     = 1
            layer.path          = UIBezierPath(ovalIn: layer.bounds).cgPath
            layer.opacity       = 0
            contentView.layer.insertSublayer(layer, at: 0)
            rippleLayers.append(layer)
        }
    }

fileprivate func _initRipple(_ phoneImage: UIImage) {
    
    let count = 5
    let rippleWidth: CGFloat = phoneImage.size.width * 0.8
    for _ in 0..<count {
        let layer            = CAShapeLayer()
        layer.contentsScale  = UIScreen.main.scale
        layer.bounds         = CGRect(x: 0, y: 0, width: rippleWidth, height: rippleWidth)
        layer.anchorPoint    = CGPoint(x: 0.5, y: 0.5)
        // 光圈颜色等待确定修改
        layer.strokeColor    = UIColor.lightGray.cgColor
        layer.fillColor      = UIColor.clear.cgColor
        layer.lineWidth      = 1
        layer.path           = UIBezierPath(ovalIn: layer.bounds).cgPath
        layer.opacity        = 0
        contentView.layer.insertSublayer(layer, at: 0)
        rippleLayers.append(layer)
    }
}