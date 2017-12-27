extension ShareListViewController {
    
    // 数据源
    func reloadFriendList() {
        friends = []
        mynt?.shareUsers(success: { [weak self] friends in
            self?.friends = friends
            self?.tableView.mj_header.endRefreshing()
            }, failure: { [weak self] _, message in
                if self?.friends.isEmpty == true {
                    self?.friends = []
                }
                MTToast.show(message)
        })
    }
    
    // 停止分享弹框
    func didClickDeleteDialog(friend: SCFriend) {
        let message = MTLocalizedString("GPS_SHARE_DELETE_MESSAGE", comment: "")
        DialogManager.shared.show(text: message) { [weak self] _ in
            self?.didClickStopShareButton(friend: friend)
        }
    }
    
    func didClickStopShareButton(friend: SCFriend) {
        guard let mynt = self.mynt else { return }
        if friends.isEmpty { return }
        mynt.stopShare(userId: friend.friendId, success: { [weak self] in
            self?.friends.remove(object: friend)
            
            }, failure: { _, message in
                MTToast.show(message)
        })
    }
    
}

extension ShareListViewController {
    
    // 数据源
    func reloadFriendList() {
        friends = []
        mynt?.shareUsers(success: { [weak self] friends in
            self?.friends = friends
            self?.tableView.mj_header.endRefreshing()
            }, failure: { [weak self] _, message in
                if self?.friends.isEmpty == true {
                    self?.friends = []
                }
                MTToast.show(message)
        })
    }

    // 停止分享弹框
    func didClickDeleteDialog(friend: SCFriend) {
        let message = MTLocalizedString("GPS_SHARE_DELETE_MESSAGE", comment: "")
        DialogManager.shared.show(text: message) { [weak self] _ in
            self?.didClickStopShareButton(friends: friend)}
    }
}