@objc func didClickNavigationButton(_ sender: AnyObject) {
        if selectLocation?.coordinate.isNull == false {
            MapNavigationKit.shared.selectMapApp(fromCoordinate: userCoordinate,
                                                 toCoordinate: selectLocation!.coordinate,
                                                 view: view)
        }
    }


@objc func didClickNavigationButton(_ sender: AnyObject) {
        if selectLocation?.coordinate.isNull == false {
            MapNavigationKit.shared.selectMapApp(fromCoordinate: userCoordinate,
                                                 toCoordinate: selectLocation!.coordinate,
                                                 view: view)
        }
}