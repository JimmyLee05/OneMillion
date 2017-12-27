var click: [SCClickValue] {
        switch self {
        case .camera:
            return [.cameraShutter]
        case .music:
            return [.musicPlay, .musicNext, .musicPrevious]
        case .phone:
            return []
        case .ppt:
            return [.pptNextPage, .pptPreviousPage]
        default:
            return []
        }
    }

var click: [SCClickValue] {
        switch self {
        case .camera:
            return [.cameraShutter]
        case .music:
            return [.musicPlay, .musicNext, .musicPrevious]
        case .phone:
            return []
        case .ppt:
            return [.pptNextPage, .pptPreviousPage]
        default:
            return []
        }
}