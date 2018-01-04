 var selectedType: SelectedType = .left {
        didSet {
            let selectedLeft = selectedType == .left
            
            leftView.backgroundColor = selectedLeft ? UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00) : UIColor.clear
            rightView.backgroundColor = !selectedLeft ? UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00) : UIColor.clear
            leftHookImageView.isHidden  = !selectedLeft
            rightHookImageView.isHidden = selectedLeft
        }
    }

var selectedType: SelectedType = .left {
        didSet {
            let selectedLeft = selectedType == .left

            leftView.backgroundColor    = selectedLeft ? UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00) : UIColor.clear
            rightView.backgroundColor   = !selectedLeft ? UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00) : UIColor.clear
            leftHookImageView.isHidden  = !selectedLeft
            rightHookImageView.isHidden = selectedLeft
        }
}