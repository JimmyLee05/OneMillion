if status == .denied || status == .restricted {
            DialogManager.shared.show(title: MTLocalizedString("SERVICE_CLOSED_TITLE", comment: "服务已关闭"),
                                      message: String(format: MTLocalizedString("SERVICE_CLOSED_MESSAGE", comment: "服务已关闭"),
                                                      MTLocalizedString("GALLERY", comment: "相册")),
                                      buttonString: MTLocalizedString("APP_SETTINGS", comment: "设置"),
                                      clickOkHandler: { (dialog) in
                                        UIApplication.openSystemSetting()
            })
            return
        }


if status == .denied || status == .restricted {
            DialogManager.shared.show(title: MTLocalizedString("SERVICE_CLOSED_TITLE", comment: "服务已关闭")，
                                      message: String(format: MTLocalizedString("SERVICE_CLOSED_MESSAGE", comment: "服务已关闭"),
                                                      MTLocalizedString("GALLERY", comment: "相册")),
                                      buttonString: MTLocalizedString("APP_SETTINGS", comment: "设置"),
                                      clickOkHandler: { (dialog) in
                                        UIApplication.openSystemSetting()
            })
            return
        }
}