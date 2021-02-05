//
//  UIStoryboard+VCinitiator.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/11.
//

import Foundation
import UIKit
import KWDrawerController
/// `VC initiator class extension via storyboard`
@available(iOS 13.0, *)
extension UIStoryboard {
    
    fileprivate class func mainViewSB() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    class func mainViewController() -> UINavigationController {
        return mainViewSB().instantiateViewController(withIdentifier: "mainVC") as! UINavigationController
    }
    class func splashViewController() -> SplashViewController {
        return mainViewSB().instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
    }
    class func MainView() -> MainViewController {
        let vc  =  mainViewSB().instantiateViewController(identifier: "MainViewController") as! MainViewController
        return vc
    }
}
