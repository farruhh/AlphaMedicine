//
//  SymtomsCell.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/13.
//

import UIKit

/// `UItableViewCell: for Symptoms Data`
class SymtomsCell: UITableViewCell {
    @IBOutlet weak var symptomName: UILabel!
    static let identifier = "SymtomsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    /// `Configures and sets the cell data`
    /// - Parameter data: Symptom
    func configure(data: Symptom) {
        self.symptomName.text = data.name
    }
}
