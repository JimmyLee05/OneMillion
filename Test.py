fileprivate func loadDefaultAvatar(_ block: (() -> Void)? = nil) {
        let usage = self.usage
        // 开始绘图
        DispatchQueue.global().async { [weak self] in
            guard let mynt = self else { return }
            let image = usage.myntAvatar(mynt: mynt)
            let color = usage.usageColor

            // 开始绘制 120 x 120 大小的图片
            let avatar = UIImage.create(with: 120, icon: image, color: color)

            DispatchQueue.main.async { [weak self] in
                self?.avatar = avatar?.round()
                block?()
            }
        }
    }

fileprivate func loadDefaultAvatar(_ block: (() -> Void)? = nil) {
        let usage = self.usage
        // 开始绘图
        DispatchQueue.global().async { [weak self] in
            guard let mynt = self else { return }
            let image = usage.myntAvatar(mynt: mynt)
            let color = usage.usageColor

            // 开始绘制 120 x 120 大小的图片
            let avatar = UIImage.create(with: 120, icon: image, color: color)

            DispatchQueue.main.async { [weak self] in
                self?.avatar = avatar?.round()
                block?()
            }
        }
    }

