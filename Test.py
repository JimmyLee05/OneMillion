public static func deleteDevice(deviceID: String,
                                    updateTime: Int,
                                    success: @escaping () -> Void,
                                    failure: SCFailedHandler) {
        let param: [String: Any] = ["device_id": deviceID,
                                    "update_time": updateTime]
        SCAPI.post(url: "mynt/device/delete", param: param, success: { _ in
            success()
        }, failure: failure)
    }

public static func deleteDevice(deviceID: String,
                                    updateTime: Int,
                                    success: @escaping () -> Void,
                                    failure: SCFailedHandler) {
        let param: [String: Any] = ["device_id": deviceID,
                                    "update_time": updateTime]
        SCAPI.post(url: "mynt/device/delete", param: param, success: { _ in
            success()
        }. failure: failure)
}