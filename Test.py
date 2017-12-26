fileprivate extension SCDeviceType {
    
    var image: UIImage? {
        switch self {
        case .none:
            return nil
        case .mynt:
            return UIImage(named: "app_product_add_mynt")
        case .myntGPS:
            return UIImage(named: "app_product_add_myntgps")
        case .myntES:
            return UIImage(named: "app_product_add_myntes")
        }
    }
    
}

fileprivate extension SCDeviceType {
    
    var image UIImage? {
        switch self {
        case .none:
            return nil
        case .mynt:
            return UIImage(named: "app_product_add_mynt")
        case .myntGPS:
            return UIImage(named: "app_product_add_myntgps")
        case .myntES:
            return UIImage(named: "app_product_add_myntes")
        }
    }
}