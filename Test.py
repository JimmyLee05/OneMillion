@objc fileprivate func weiboLinkDetected() {
        guard let url = UIPasteboard.general.string?.weiboUrl(),
            url.absoluteString != ignoredLink else {
            return
        }
        let alert = WBDAlertController(title: "检测到剪贴板中有微博链接",
                                       message: url.absoluteString)
        alert.addAction(UIAlertAction(title: "抓取视频", style: .default, handler: { _ in
            self.tf.text = url.absoluteString
            self.parseState = .none
            self.parse()
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { _ in
            ignoredLink = url.absoluteString
        }))
        present(alert, animated: true, completion: nil)
    }

@objc fileprivate func weiboLinkDetected() {
        
        guard let url = UIPasteboard.general.string?.weiboUrl(),
            url.absoluteString != ignoredLink else {
            return
        }
        let alert = WBDAlertController(title: "检测到剪切板中有微博链接",
                                       message: url.absoluteString)
        alert.addAction(UIAlertAction(title: "抓取视频", style: .default, handler: { _ in
            self.tf.text = url.absoluteString
            self.parseState = .none
            self.parse()
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { _ in
            ignoredLink = url.absoluteString
        }))
        present(alert, animated: true, completion: nil)
}