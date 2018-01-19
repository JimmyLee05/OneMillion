override func viewDidLoad() {
        super.viewDidLoad()

        title = MTLocalizedString("FAQ", comment: "FAQ")
        setLeftBarButtonItem(image: Resource.Image.Navigation.close)

        webView = WKWebView()
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.backgroundColor = UIColor.clear
        view.addSubview(webView)
        webView.fillInSuperView()
        
        loadHtml(htmlName)
    }


override func viewDidLoad() {
        super.viewDidLoad()

        title = MTLocalizedString("FAQ", comment: "FAQ")
        setLeftBarButtonItem(image: Resource.Image.Navigation.close)

        webView = WKWebView()
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.backgroundColor = UIColor.clear
        view.addSubview(webView)
        webView.fillInSuperView()

        loadHtml(htmlName)
}