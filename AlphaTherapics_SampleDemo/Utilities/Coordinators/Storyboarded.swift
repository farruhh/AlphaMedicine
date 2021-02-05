//
//  Storyboarded.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/12.
//

import Foundation
import UIKit

/// `Coordinator Pattern: Storyboard initializer Protocol`
/// `Make sure all the VCs confirm to the < StoryBoarded > protocol `
protocol StoryBoarded {
    static func instantiate() -> Self
}
extension StoryBoarded where Self: UIViewController {
    static func instantiate() ->  Self {
        let id = String (describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        if #available(iOS 13.0, *) {
            return storyboard.instantiateViewController(identifier: id) as! Self
        } else {
            // Fallback on earlier versions
        }
        return instantiate()
    }
}
extension StoryBoarded where Self: UITableViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
   
        if #available(iOS 13.0, *) {
            return storyboard.instantiateViewController(identifier: id) as! Self
        } else {
            // Fallback on earlier versions
        }
        return instantiate()
    }
}
