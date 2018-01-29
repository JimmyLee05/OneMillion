/**
 */

import UIKit

//*****************************************************************
// MARK: - Extensions
//*****************************************************************

public extension UIColor {
  public class func fuberBlue()->UIColor {
    struct C {
      static var c : UIColor = UIColor(hue:0.68, saturation:0.21, brightness:0.24, alpha:1.00)
    }
    return C.c
  }
  
  public class func fuberLightBlue()->UIColor {
    struct C {
      static var c : UIColor = UIColor(red: 77/255, green: 181/255, blue: 217/255, alpha: 1)
    }
    return C.c
  }
}

//*****************************************************************
// MARK: - Helper Functions
//*****************************************************************

public func delay(_ delay:Double, closure:@escaping ()->()) {
  DispatchQueue.main.asyncAfter(
    deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}
