//
//  MainViewController.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/09.
//

import UIKit
import SwiftyJSON

/// `Main/Initial View after the successful launch of the application`
class MainViewController: UITableViewController, StoryBoarded {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var AlphaTherapicsLab: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var storyCollectionView: UICollectionView!
    weak var coordinator: MainCoordinator?
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "AlphaTherapics"
        self.profileImageView.image = UIImage.init(imageLiteralResourceName: "logo_simple")
        self.AlphaTherapicsLab.text = "AlphaTherapicsLab"
        self.profileButton.imageView?.image = UIImage.init(imageLiteralResourceName: "buttonImage")
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.black
    }
    //MARK: - preferredStatusBarStyle
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //MARK: - onProfileClicked()
    /// `Presents UIAlert Box with a "Under Development message`
    /// - Parameter sender: UIButton
    @IBAction func onProfileClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Under development!", message: "Under development yet!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
@available(iOS 13.0, *)
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            let size = (collectionView.frame.width - 30) / 3
            let height = (collectionView.frame.height) / 3
            return CGSize(width: size, height: height / 16 * 16)
        }
        else if collectionView == storyCollectionView {
            let screeenRect = UIScreen.main.bounds
            let screenWidth = screeenRect.size.width
            return CGSize(width: screenWidth,  height: collectionView.frame.height )
        }
        return CGSize(width:(collectionView.frame.width - 30) / 2, height: collectionView.frame.height )
    }
}
// MARK: - UICollectionViewDataSource
@available(iOS 13.0, *)
extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return 9
        }
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            return configureCategoryCell(collectionView, indexPath: indexPath)
        }
        return configureStoryCell(collectionView, indexPath: indexPath)
    }
    //MARK: - configureStoryCell
    /// `Dequeues the cell and prepares the cell to be utilized by the parent VC`
    /// - Parameters:
    ///   - collectionView: UICollectionView
    ///   - indexPath: IndexPath
    /// - Returns: UICollectionViewCell
    func configureStoryCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath) as! StoryCell
        cell.imageView.image = UIImage.init(imageLiteralResourceName: "doctor")
        cell.setCellAttribute()
        return cell
    }
    //MARK: - configureCategoryCell
    /// `Dequeues the cell and prepares the cell to be utilized by the parent VC`
    /// - Parameters:
    ///   - collectionView: UICollectionView
    ///   - indexPath: IndexPath
    /// - Returns: UICollectionViewCell
    func configureCategoryCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        
        switch indexPath.row {
        case 0:
            cell.label.text = "General Symptoms"
            cell.imageView.image = UIImage.init(imageLiteralResourceName: "symtom")
        case 1:
            cell.label.text = "Dermatology"
            cell.imageView.image = UIImage.init(imageLiteralResourceName: "skin")
        case 2:
            cell.label.text = "ENT/Oral Medicine" // restoration or rst or productize
            cell.imageView.image = UIImage.init(imageLiteralResourceName: "oral")
        case 3:
            cell.label.text = "Ophtalmology"
            cell.imageView.image = UIImage.init(imageLiteralResourceName: "eye")
        case 4:
            cell.label.text = "Neuro/Psych"
            cell.imageView.image = UIImage.init(imageLiteralResourceName: "neuro")
        case 5:
            cell.label.text = "Cardiopulmonary"
            cell.imageView.image = UIImage.init(imageLiteralResourceName: "cardio")
        case 6:
            cell.label.text = "Gastrointestinal"
            cell.imageView.image = UIImage.init(imageLiteralResourceName: "gasro")
        case 7:
            cell.label.text = "Genitourinary"
            cell.imageView.image = UIImage.init(imageLiteralResourceName: "genito")
        case 8:
            cell.label.text = "Public Health"
            cell.imageView.image = UIImage.init(imageLiteralResourceName: "public")
        default:
            break
        }
        cell.setCellAttribute()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            if let vc  = self.storyboard?.instantiateViewController(identifier: "SymptomsViewController") as? SymptomsViewController {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            print("next collectionView not ready yet.. .")
        }
    }
}
