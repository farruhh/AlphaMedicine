//
//  SymptomsCell.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/09.
//

import Foundation
import UIKit

/// `TableViewCell: for diagnosis Data`
class DiagnosisCell: UITableViewCell {
    @IBOutlet weak var icdName: UILabel!
    @IBOutlet weak var accuracy: UILabel!
    @IBOutlet weak var diseaseName: UILabel!
    @IBOutlet weak var profName: UILabel!
    @IBOutlet weak var specialization: UILabel!
    static let identifier = "DiagnosisCell"
    
    /// `Configures the cell and cell's values`
    /// - Parameter data: DiagnosisElement
    func configure(data: DiagnosisElement) {
        self.diseaseName.text = data.issue?.name
        self.accuracy.text = String(describing: data.issue?.accuracy)
        self.profName.text = data.issue?.profName
        self.icdName.text = data.issue?.icdName
        for sp in data.specialisation! {
            self.specialization.text = sp.name
        }
    }
}
