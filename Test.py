 public class func changeAvatar(avatar: SCImage,
                                   success: @escaping (String) -> Void,
                                   failure: SCFailedHandler) {
        post(url: "user/avatar", param: [:], image: avatar, success: { json in
            success(json["avatar"].stringValue)
            updateAvatar(avatar: json["avatar"].stringValue)
        }, failure: failure)
    }

public class func changeAvatar(avatar: SCImage,
                               success: @escaping (String) -> Void,
                               failure: SCFailedHandler) {
        post(url: "user/avatar", param: [:], image: avatar, success: { json in
            success(json["avatar"].stringValue)
            updateAvatar(avatar: json["avatar"].stringValue)
        }, failure: failure)
}