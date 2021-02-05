//
//  AlertUtility.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/09.
//

import Foundation
import UIKit

class AlertUitility {
    static func showAlertMsg(vc: UIViewController? = nil, title: String, message: String, buttonText: String = "확인", handler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: buttonText, style: .default, handler:  { (action: UIAlertAction) in
            guard let handler = handler else {
                return
            }
            handler()
        })
        alertController.addAction(confirmAction)
    }
    static func showInDevelopingMsg() {
        showAlertMsg(title: "개발중", message: "잠시만 기다려주세요")
    }
}
