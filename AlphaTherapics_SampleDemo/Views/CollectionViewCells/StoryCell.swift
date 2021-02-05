//
//  StoryCell.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/09.
//

import Foundation
import UIKit

/// `MainVC: CollectionView Story Cell`
class StoryCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "StoryCell"
    //Set Cell Attributes
    func setCellAttribute() {
        self.layer.cornerRadius = 8
        self.layer.shadowRadius = 9
        self.layer.masksToBounds = true
    }
}
