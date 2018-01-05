if UIApplication.shared.applicationState == .background {
            // 后台进行推送
            let message = String(format: MTLocalizedString("MYNTSETTING_INFO_LOWPOWER_DIALOG_MESSAGE", comment: ""), mynt.name)
            STJPushKit.shared().pushLocalNotification(nil,
                                                      subtitle: nil,
                                                      body: message,
                                                      identifier: mynt.sn,
                                                      sound: nil,
                                                      userInfo: ["sn": mynt.sn])
        }


if UIApplication.shared.applicationState == .background {
            // 后台进行推送
            let message = String(format: MTLocalizedString("MYNTSETTING_INFO_LOWPOWER_DIALOG_MESSAGE", comment: ""), mynt.name)
            STJPushKit.shared().pushLocalNotification(nil,
                                                      subtitle: nil,
                                                      body: message,
                                                      identifier: mynt.sn,
                                                      sound: nil,
                                                      userInfo: ["sn": mynt.sn])
}