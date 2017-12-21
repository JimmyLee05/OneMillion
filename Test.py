// 加入断线位置
        if mynt != nil && mynt?.coordinate.isNull == false {
            let disconnectLocation = SCDevice.SCLocation(latitude: mynt!.latitude, longitude: mynt!.longitude, time: mynt!.lastDisconnectTime)
            sourceLocations.append(disconnectLocation)
        } else {
            // 没有位置
            locationLabel.text  = MTLocalizedString("MYNTSETTING_MAP_NODATA", comment: "没有数据")
            dateLabel.text      = MTLocalizedString("MYNTSETTING_MAP_NODATA", comment: "没有数据")
        }

//加入断线位置
        if mynt != nil && mynt?.coordinate.isNull == false {
            let disconnectLocation = SCDevice.SCLocation(latitude: mynt!.latitude, longitude: mynt!.longitude, time: mynt!.lastDisconnectTime)
        } else {
            // 没有位置
            locationLabel.text = MTLocalizedString("MYNTSETTING_MAP_NODATA", comment: "没有数据")
            dateLabel.text     = MTLocalizedString("MYNTSETTING_MAP_NODATA", comment: "没有数据")
        }