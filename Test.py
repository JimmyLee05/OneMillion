public class func login(email: String,
                            password: String,
                            success: @escaping (SCUser, Bool) -> Void,
                            failure: SCFailedHandler) {
        let param: [String: Any] = ["email": email,
                                    "pass": password.md5]
        post(url: "user/login", auth: false, param: param, success: { (json) in
            let user = Json2User(email: email, json: json)
            let check = json["login_device_check"].int

            if !SCloud.shared.isMYNTAPP {
                user.save()
                success(user, false)
                return
            }
            if check != nil && check == 1 {
                tempUser = user
                success(user, true)
            } else {
                user.save()
                success(user, false)
            }
        }, failure: failure)
    }

public class func login(email: String,
                        password: String,
                        success: @escaping (SCUser, Bool) -> Void,
                        failure: SCFailedHandler) {
        let param: [String: Any] = ["email": email,
                                    "pass":password.md5]
        post(url: "user/login", auth: false, param: param, success: { (json) in
            let user = Json2User(email: email, json: json)
            let check = json["login_device_check"].int

            if !SCloud.shared.isMYNTAPP {
                user.save()
                success(user, false)
                return
            }
            if check != nil && check == 1 {
                tempUser = user
                success(user, true)
            } else {
                user.save()
                success(user, false)
            }
        }, failure: failure)
}







