@objc func didClickInfoView() {
        showEditView = !showEditView
        
        /*    展开编辑框     */
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(UIViewAnimationCurve.easeInOut)
        editHeightConstraint.constant = showEditView ? editViewHeight : 0
        layoutIfNeeded()
        UIView.commitAnimations()
        
        /*    箭头翻转    */
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        animation.fromValue = showEditView ? 0 : Double.pi
        animation.toValue   = showEditView ? Double.pi : 0
        animation.duration  = 0.4
        animation.isRemovedOnCompletion = false
        animation.fillMode  = kCAFillModeForwards
        arrowImageView.layer.add(animation, forKey: "transform.rotation.x")
    }

@objc func didClickInfoView() {
        showEditView = !showEditView

        /* 展开编辑框 */
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(UIViewAnimationCurve.easeInOut)
        editHeightConstraint.constant = showEditView ? editViewHeight : 0
        layoutIfNeeded()
        UIView.commitAnimations()

        /* 箭头翻转 */
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        animation.fromValue = showEditView ? 0 : Double.pi
        animation.toValue   = showEditView ? Double.pi : 0
        animation.duration  = 0.4
        animation.isRemovedOnCompletion = false
        animation.fillMode  = kCAFillModeForwards
        arrowImageView.layer.add(animation, forKey: "transform.rotation.x")
}