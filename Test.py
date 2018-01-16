protocol MTCoverFlowViewDelegate: NSObjectProtocol {

    func numberOfItemsInCoverFlowViewn(_ collectionView: MTCoverFlowView) -> Int

    func coverFlowView(_ coverFlowView: MTCoverFlowView, cellForItemAt index: Int, cell: MTCoverFlowView.CoverFlowViewCell)

    func coverFlowView(_ coverFlowView: MTCoverFlowView, didSelectItemAt index: Int)

}

protocol MTCoverFlowViewDelegate: NSObjectProtocol {
    
    func numberOfItemsInCoverFlowViewn(_ collectionView: MTCoverFlowView) -> Int

    func coverFlowView(_ coverFlowView: MTCoverFlowView, cellForItemAt index: Int, cell: MTCoverFlowView.CoverFlowViewCell)

    func coverFlowView(_ coverFlowView: MTCoverFlowView, didSelectItemAt index: Int)
}