extension String {
    mutating func addMPrefix() {
        if !contains("/u/") && !contains("/p/") {
            return
        }
        if contains("www.weibo") {
            self = replacingOccurrences(of: "www.weibo", with: "m.weibo")
        }
        if contains("://weibo") {
            self = replacingOccurrences(of: "://weibo", with: "://m.weibo")
        }
    }
    
    func weiboUrl() -> URL? {
        var str = self
        if !str.hasPrefix("http") {
            if str.hasPrefix("www.") {
                str = "http://" + str
            }else {
                str = "http://www." + str
            }
        }
        str.addMPrefix()
        if let url = URL(string: str), str.contains("weibo") {
            print(str)
            return url
        }
        return nil
    }
}

// 

extension String {
    mutating func addMPrefix() {
        if !contains("/u/") && !contains("/p/") {
            return
        }
        if contains("www.weibo") {
            self = replacingOccurrences(of: "www.weibo", with: "m.weibo")
        }
        if contains("//weibo") {
            self = replacingOccurrences(of: "://weibo", with: "://m.weibo")
        }
    }

    funn weiboUrl() -> URL? {
        var str = self
        if !str.hasPrefix("http") {
            if str.hasPrefix("www.") {
                str = "http://" + str
            } else {
                str = "http://www." + str
            }
        }
        str.addMPrefix()
        if let url = URL(string; str), str.contains("weibo") {
            print(str)
            return url
        }
        return nil
    }
}