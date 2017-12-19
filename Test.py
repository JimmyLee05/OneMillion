 func didClickInfoView(isClickMenu: Bool = false) {
        if mynt?.isOwner == false && !AppConfig.canShareEdit { return }

        guard let contentView = contentView else { return }
        contentView.infoView.rotateArrow(isExpand: contentView.infoView.subview == nil)
        if contentView.infoView.subview == nil {
            contentView.scrollView.expand(contentView.editView, below: contentView.infoView)
        } else {
            contentView.scrollView.shrink(contentView.infoView)
        }
        if isClickMenu && contentView.infoView.subview != nil {
            contentView.scrollView.setContentOffset(.zero, animated: true)
        }
    }


func didClickInfoView(isClickMenu: Bool = false) {
    if mynt?.isOwner == false && !AppConfig.canShareEdit { return }

    guard let contentView = contentView else { return }
    contentView.infoView.rotateArrow(isExpand: contentView.infoView.subview == nil)
    if contentView.infoView.subview == nil {
        contentView.scrollView.expand(contentView.editView, below: contentView.infoView)
    } else {
        contentView.scrollView.shrink(contentView.infoView)
    }
    if isClickMenu && contentView.infoView.subview != nil {
        contentView.scrollView.setContentOffset(.zero, animated: true)
    }
}




