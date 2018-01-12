 class func updateToken(token: String) {
        let user = currentUser()
        user?.token = token
        user?.save()
    }

class func updateAvatar(avatar: String) {
    let user = currentUser()
    user?.avatar = avatar
    user?.save()
}

class func updateToken(token: String) {
        let user = currentUser()
        user?.token = token
        user?.save()
}

class func updateAvatar(avatar: String) {
    let user = currentUser()
    user?.avatar = avatar
    user?.save()
}






