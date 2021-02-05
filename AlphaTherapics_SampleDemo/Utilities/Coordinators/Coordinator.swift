//
//  Coordinator.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/12.
//

import Foundation
import UIKit

/// `Coordinator Pattern: Coordinator Protocol`
protocol Coordinator {
    var subCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    /// `Initializer delegate method through the < Coordinator > pattern`
    func start()
}
