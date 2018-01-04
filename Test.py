func formatTime(time: Int, ignoreState: Bool = false) -> String {
        // 不满60分钟   xxx minute ago
        // 不满24小时   xxx hour ago
        // 超过24小时   xxx day ago
        let minute: Double = 60
        let hour: Double   = minute * 60
        let day: Double   = hour * 24
        let dValue: Double = Date().timeIntervalSince1970 - Double(time)

        if state == .connected && !ignoreState {
            return MTLocalizedString("DISCONNECT_TIME_NOW", comment: "now")
        }

        if time <= 0 {
            return ""
        }
        if dValue <= minute {
            return MTLocalizedString("DISCONNECT_TIME_NOW", comment: "now")
        }
        switch dValue {
        case 0..<hour:
            return String(format: MTLocalizedString("DISCONNECT_TIME_MINUTE", comment: "分钟"), dValue / minute)
        case hour..<day:
            return String(format: MTLocalizedString("DISCONNECT_TIME_HOUR", comment: "小时"), dValue / hour)
        default:
            return String(format: MTLocalizedString("DISCONNECT_TIME_DAY", comment: "天"), dValue / day)
        }
    }

func format(time: Int, ignoreState: Bool = false) -> String {
    // 不满60分钟 xxx minute ago
    // 不满24小时 xxx hour ago
    // 超过24小时 xxx day ago
    let minute: Double = 60
    let hour: Double   = minute * 60
    let day: Double    = hour * 24
    let dValue: Double = Date().timeIntervalSince1970 - Double(time)

    
}