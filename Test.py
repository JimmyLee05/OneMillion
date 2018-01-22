extension UITextField {
    
    func shimmerOrStop() {
        if let superview = self.superview, superview.isKind(of: FBShimmeringView.classForCoder()) {
            if let text = self.text, text != "" {
                (superview as? FBShimmeringView)?.isShimmering = false
            }else {
                (superview as? FBShimmeringView)?.isShimmering = true
            }
        }else {
            let shimmerView = FBShimmeringView()
            self.superview?.insertSubview(shimmerView, belowSubview: self)
            shimmerView.snp.makeConstraints({
                $0.edges.equalTo(self)
            })
            shimmerView.contentView = self
            shimmerView.isShimmering = true
        }
    }
    
}

extension UITextField {
    
    func  shimmerOrStop() {
        if let superview = self.superview, superview.isKind(of: FBShimmeringView.classForCoder()) {
            if let text = self.text, text != "" {
                (superview as? FBShimmeringView)?.isShimmering = false
            } else {
                (superview as? FBShimmeringView)?.isShimmering = true
            }
        } else {
            let shimmerView = FBShimmeringView()
            self.superview?.insertSubview(shimmerView, belowSubview: self)
            shimmerView.snp.makeConstraints({
                $0.edges.equalTo(self)
            })
            shimmerView.contentView = self
            shimmerView.isShimmering = true
        }
    }
}