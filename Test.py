class RoundedRectangleMaskLayer: CAShapeLayer {

    override var cornerRadius: CGFloat {
        didSet {
            setNeedsDisplay()
            layoutIfNeeded()
        }
    }
    override var bounds: CGRect {
        didSet {
            setNeedsDisplay()
            layoutIfNeeded()
        }
    }

    override init() {
        super.init()
        contentsScale = UIScreen.main.scale
        position = CGPoint.zero
        anchorPoint = CGPoint.zero
    }

    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(in ctx: CGContext) {
        ctx.setFillColor(UIColor.red.cgColor)
        let bezierPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        ctx.addPath(bezierPath.cgPath)
        ctx.fillPath()
    }

}


class RoundedRectangleMaskLayer: CAShapeLayer {
    
    override var cornerRadius: CGFloat {
        didSet {
            setNeedsDisplay()
            layoutIfNeeded()
        }
    }

    override var bounds: CGRect {
        didSet {
            setNeedsDisplay()
            layoutIfNeeded()
        }
    }

    override init() {
        super.init()
        contentsScale = UIScreen.main.scale
        position = CGPoint.zero
        anchorPoint = CGPoint.zero
    }

    override init(layer: Any) {
        super.init(layer: layer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(in ctx: CGContext) {
        ctx.setFillColor(UIColor.red.cgColor)
        let bezierPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        ctx.addPath(bezierPath.cgPath)
        ctx.fillPath()
    }
}


