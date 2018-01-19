enum CellType {
    case buy
    case safezone
    case faq
    
    var count: Int {
        switch self {
        case .buy:
            return 1
        case .faq:
            return 16
        default:
            return 0
        }
    }
    
}

enum CellType {
    case buy
    case safezone
    case faq

    var count: Int {
        switch self {
        case .buy:
            return 1
        case .faq:
            return 16
        default:
            return 0
        }
    }
}