func showMenu() {
        let text = isShowPath ? MTLocalizedString("HIDE_STRACK", comment: "隐藏轨迹") : MTLocalizedString("SHOW_STRACK", comment: "显示轨迹")
        let actionSheet = UIActionSheet(title: nil,
                                        delegate: self,
                                        cancelButtonTitle: MTLocalizedString("SECURE_AREA_DELETE_CANCEL", comment: "取消"),
                                        destructiveButtonTitle: nil,
                                        otherButtonTitles: text)
        actionSheet.show(in: view)
    }


func showMenu() {
        let text = isShowPath ? MTLocalizedString("HIDE_STRACK", comment: "隐藏轨迹") : MTLocalizedString("SHOW_STRACK", comment: "显示轨迹")
        let actionSheet = UIActionSheet(title: nil,
                                        delegate: self,
                                        cancelButtonTitle: MTLocalizedString("SECURE_AREA_DELETE_CANCEL", comment: "取消"),
                                        destructiveButtonTitle: nil,
                                        otherButtonTitles: text)
        actionSheet.show(in: view)
}