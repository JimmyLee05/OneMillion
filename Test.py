@objc func updateTipsImage() {
    guard let mynt = mynt else { return }
    // mynt规则
    func useMyntRule() {
        switch mynt.uiState {
        case .online:
            //蓝牙在线，随机显示
            updateRandomTips([.phoneAlarm, .myntAlarm])
        case .connecting:
            tips = .connecting
        default:
            let ruleHandler = { [weak self] in
                if let mynt = self?.mynt {
                    if Int(Date().timeIntervalSince1970) - mynt.lastDisconnectTime < 3600 {
                        // 断线时间小于1小时
                        self?.updateRandomTips([.walk, .map])
                    } else {
                        //断线时间缠裹一小时
                        if mynt.lostState == .reportLost {
                            //已报丢
                            self?.updateRandomTips([.map, .askhelp])
                        } else {
                            //未报丢
                            self?.updateRandomTips([.walk, .notice])
                        }
                    }
                }
            }
            // 进行经纬度请求，检测是否在500米以内，显示walk
            requestLocation { [weak self] location in
                if let mynt = self?.mynt,
                    let location = location {
                    if self?.tips = .walk && location.coordinate.distance(from: mynt.coordinate) < 500 {
                        self?.tips = .walk
                        return
                    }
                }
            }
            ruleHandler()
        }
    }

}


private extension SCDevice.SCLocation.LocType {
    
    var typeImage: UIImage? {
        switch self {
        case .gps:
            return UIImage(named: "map_type_gps")
        case .mobile:
            return UIImage(named: "map_type_mobile")
        case .station:
            return UIImage(named: "map_type_station")
        default:
            return nil
        }
    }
}



