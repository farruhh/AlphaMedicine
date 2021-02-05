//
//  SplashViewController.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/11.
//

import UIKit
import Lottie

/// `SplashAnimationViewController - loads Custom Animation during the App launch`
class SplashViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    //MARK: -viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    // MARK: - viewDidAppear()
    override func viewDidAppear(_ animated: Bool) {
        let animationView = AnimationView()
        let animation = Animation.named("SplashAnimation", bundle: Bundle.main)
        animationView.animation = animation
        animationView.frame = CGRect(origin: .zero, size: CGSize(width: self.view.frame.size.width, height: 200))
        animationView.center = self.view.center
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        animationView.play { (finished) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                if let vc = self.storyboard?.instantiateViewController(identifier: "MainViewController") as? MainViewController {
                    self.view.window?.rootViewController = vc
                    self.view.window?.makeKeyAndVisible()
                }
            })
        }
        view.addSubview(animationView)
    }
}
