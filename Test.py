
extension HomeViewController {

    // 选中
    func didSelectTableView(mynt: Mynt?) {
        MyntInfoViewController.push(mynt: mynt, parentViewController: self)
    }

}

extension HomeViewController {
    
    // 选中
    func didSelectTableView(mynt: Mynt?) {
        MyntInfoViewController.push(mynt: mynt, parentViewController: self)
    }
}

func myntKit(myntKit: MYNTKit, didAddMynt mynt: Mynt) {
        // 新增设备
        homeListView?.tableView.reloadData()
        updateMapView()
    }

func myntKit(myntKit: MYNTKit, didAddMynt mynt: Mynt) {
        // 新增设备
        homeListView?.tableView.reloadData()
        updateMapView()
}