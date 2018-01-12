public class func updateUUID(success: @escaping () -> Void,
                                 failure: SCFailedHandler) {
        var param: [String: Any] = [:]
        if let user = tempUser {
            param["token"] = user.token
            param["user_id"] = user.userID
        }
        post(url: "user/uuid/update", auth: false, param: param, success: { _ in
            tempUser?.save()
            success()
        }, failure: failure)
    }

public class func updateUUID(success: @escaping () -> Void,
                                failure: SCFailedHandler) {
        var param: [String: Any] = [:]
        if let user = tempUser {
            param["token"] = user.token
            param["user_id"] = user.userID
        }
        post(url: "user/uuid/update", auth: false, param: param, success: { _ in
            tempUser?.save()
            success()
        }, failure: failure)
}