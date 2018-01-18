import UIKit

class CrashViewController: BaseViewController {

    override var isShowBackgroundLayer: Bool { return false }

    @IBOutlet weak var fixButton: GradientButton!
    @IBOutlet weak var messageLabel: UILabel!

    var cancelHandler: ((UIViewController?) -> Void)?

    var fixedHandler: ((UIViewController?) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crash"
        setLeftBarButtonItem(image: Resource.Image.Navigation.close)

        fixButton.setButtonBackgroundColorStyle(ColorStyle.kBlueGradientColor)
        fixButton.setTitle(NSLocalizedString("CRASH_FIX", comment: ""), for: .normal)
        messageLabel.text = NSLocalizedString("CRASH_MESSAGE", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func leftBarButtonClickedHandler() {
        AppConfig.isSimulatedCrash = false
        dismiss(animated: true)
        cancelHandler?(self)
    }

    @IBAction func didClickFixButton(_ sender: Any) {
        CrashUtils.deleteAllFilesUnderDocumentsLibraryCaches()
        dismiss(animated: true)
        fixedHandler?(self)
    }

}

import UIKit

class CrashViewController: BaseViewController {
    
    override var isShowBackgroundLayer: Bool { return false }

    @IBOutlet weak var fixButton: GradientButton!
    @IBOutlet weak var messageLabel: UILabel!

    var cancelHandler: ((UIViewController?) -> Void)?

    var fixedHandler: ((UIViewController?) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crash"
        setLeftBarButtonItem(image: Resource.Image.Navigation.close)

        fixButton.setButtonBackgroundColorStyle(ColorStyle.kBlueGradientColor)
        fixButton.setTitle(NSLocalizedString("CRASH_FIX", comment: ""). for: .normal)
        messageLabel.text = NSLocalizedString("CRASH_MESSAGE", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func leftBarButtonClickedHandler() {
        AppConfig.isSimulatedCrash = false
        dismiss(animated: true)
        cancelHandler?(self)
    }

    @IBAction func didClickFixButton(_ sender: Any) {
        CrashUtils.deleteAllFilesUnderDocumentsLibraryCaches()
        dismiss(animated: true)
        fixedHandler?(self)
    }
}









