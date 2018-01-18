fileprivate extension SCDeviceType {
    
    var image: UIImage? {
        switch self {
        case .mynt:
            return UIImage(named: "list_mynt")
        case .myntGPS:
            return UIImage(named: "list_gps")
        case .myntES:
            return UIImage(named: "list_es")
        case .none:
            return nil
        }
    }
    
}

fileprivate extension SCDeviceType {
    
    var image: UIImage? {
        switch self {
        case .mynt:
            return UIImage(named: "list_mynt")
        case .myntGPS:
            return UIImage(named: "list_gps")
        case .myntES:
            return UIImage(named: "list_es")
        case .none:
            return nil
        }
    }
}