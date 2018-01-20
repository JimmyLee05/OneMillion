extension URL {
    // 获取重定向之后的最终 URL
    func redirect(completion:@escaping ((URL)->())) {
        var request = URLRequest(url: self, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        request.httpMethod = "HEAD"
        URLSession().dataTask(with: request) { (data, response, error) in
            if let url = response?.url {
                completion(url)
            }
        }
    }
    
    var thumbNai: UIImage? {
        do {
            let asset = AVURLAsset(url: self , options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
            return UIImage(cgImage: cgImage)
        } catch let error {
            print(error)
            return nil
        }
    }
}

extension URL {
    
    // 获取重定向之后的最终的URL
    func redirect(completion:@escaping ((URL) -> ())) {
        var request = URLRequest(url: self, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        request.httpMethod = "HEAD"
        URLSession().dataTask(with: request) { (data, response, error) in
            if let url = response?.url {
                completion(url)
            }
        }
    }

    var thumbNai: UIImage? {
        do {
            let asset = AVURLAsset(url: self, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
            return UIImage(cgImage: cgImage)
        } catch let error {
            print(error)
            return nil
        }
    }
}