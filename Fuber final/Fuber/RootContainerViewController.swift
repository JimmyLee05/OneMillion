/**
 */

import UIKit
import SplashScreenUI
import Commons

class RootContainerViewController: UIViewController {
  
  fileprivate var rootViewController: UIViewController? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    showSplashViewController()
  }
  
  func showSplashViewController() {
    
    if rootViewController is SplashViewController {
      return
    }
    
    rootViewController?.willMove(toParentViewController: nil)
    rootViewController?.removeFromParentViewController()
    rootViewController?.view.removeFromSuperview()
    rootViewController?.didMove(toParentViewController: nil)
    
    let splashViewController = SplashViewController(tileViewFileName: "Chimes")
    rootViewController = splashViewController
    splashViewController.pulsing = true
    
    splashViewController.willMove(toParentViewController: self)
    addChildViewController(splashViewController)
    view.addSubview(splashViewController.view)
    splashViewController.didMove(toParentViewController: self)
    
//    delay(2.50) {
//        self.showMenuNavigationViewController()
//    }
  }
  
  func showMenuNavigationViewController() {
    guard !(rootViewController is MenuNavigationViewController) else { return }
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nav =  storyboard.instantiateViewController(withIdentifier: "MenuNavigationController") as! UINavigationController
    nav.willMove(toParentViewController: self)
    addChildViewController(nav)

    if let rootViewController = self.rootViewController {
      self.rootViewController = nav
      rootViewController.willMove(toParentViewController: nil)
      
      transition(from: rootViewController, to: nav, duration: 0.55, options: [.transitionCrossDissolve, .curveEaseOut], animations: { () -> Void in
        
        }, completion: { _ in
          nav.didMove(toParentViewController: self)
          rootViewController.removeFromParentViewController()
          rootViewController.didMove(toParentViewController: nil)
      })
    } else {
      rootViewController = nav
      view.addSubview(nav.view)
      nav.didMove(toParentViewController: self)
    }
  }
  
  
  override var prefersStatusBarHidden : Bool {
    switch rootViewController  {
    case is SplashViewController:
      return true
    case is MenuNavigationViewController:
      return false
    default:
      return false
    }
  }
    
}
