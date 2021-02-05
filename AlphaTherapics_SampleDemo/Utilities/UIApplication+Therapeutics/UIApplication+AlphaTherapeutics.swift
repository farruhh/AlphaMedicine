//
//  UIApplication+AlphaTherapeutics.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/11.
//

import Foundation
import UIKit
/// `< UIApplication > Manager class extension`
@available(iOS 13.0, *)
extension UIApplication {
    static func app() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    static func rootNavigation() {
        let rootVC = UIStoryboard.mainViewController()
        change(rootVC)
    }
//    static func rootLoginVC() {
//        let rootVC = UIStoryboard.loginViewController()
//        change(rootVC)
//    }
    fileprivate static func change(_ vc: UIViewController) {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        window.rootViewController = vc
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: { completed in
            // maybe do something on completion here
        })
    }
}
