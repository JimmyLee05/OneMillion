public static func found(locations: [SCDevice.SCFoundLocation],
                             success: @escaping () -> Void,
                             failure: SCFailedHandler) {
        let param: [String: Any] = ["locations": locations.jsonString]
        SCAPI.post(url: "mynt/device/found", param: param, success: { _ in
            success()
        }, failure: failure)
    }

public static func found(locations: [SCDevice.SCFoundLocation],
                            success: @escaping () -> Void,
                            failure: SCFailedHandler) {
        let param: [String: Any] = ["locations": locations.jsonString]
        SCAPI.post(url: "mynt/device/found", param: param, success: { _ in
            success()
        }, failure: failure)
}
