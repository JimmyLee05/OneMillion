public static func deviceList(_ success: @escaping (_ devices: [SCDevice]) -> Void,
                                  failure: SCFailedHandler) {
        SCAPI.post(url: "mynt/device/list", param: [:], success: { json in
            success(json["device"].arrayValue.map({$0.device}))
        }, failure: failure)
    }

public static func deviceList(_ success: @escaping (_ device: [SCDevice]) -> Void,
                                    failure: SCFailedHandler) {
        SCAPI.post(url: "mynt/device/list", param: [:], success: { json in
            success(json["device"].arrayValue.map({$0.device}))
        }, failure: failure)
}
