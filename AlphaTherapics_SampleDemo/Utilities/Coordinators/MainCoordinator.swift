//
//  MainCoordinator.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/12.
//

import Foundation
import  UIKit

@available(iOS 13.0, *)
/// `Helper Class for  Custom UINavigationControl Flow.. . Alternative method where < " prepare for segue " > method is inconvinient`
/// `Make sure all the VCs inherit the delegate methods provided by the < MainCoordinator > in order to be instantiated & utilized.. .`
class MainCoordinator: Coordinator {
    var subCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    /// `Initial VC initialization`
    func start() {
        // UIApplication.app().window?.rootViewController = self.navigationController
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    /// `Initiates SymptomVC and pushes using NavigationController`
    func gotoSymptomVC() {
        let vc = SymptomsViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    /// `Initiates the DiagnosisVC and pushes using NavigationController`
    func gotoDiagnosisVC() {
        let vc = DiagnosisViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
}

