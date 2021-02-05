//
//  CategoryCell.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/09.
//

import Foundation
import UIKit

/// `MainVC: CollectionView Categories Cell`
class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    static let identifier = "CategoryCell"
    
    /// `Set Cell Attribute`
    func setCellAttribute() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
    }
}
