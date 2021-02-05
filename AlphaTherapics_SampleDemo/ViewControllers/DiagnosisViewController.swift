//
//  SymptomViewController.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/09.
//

import UIKit
import SwiftyJSON
import CocoaLumberjack
///`Shows The Detailed data of the specific diseases`
class DiagnosisViewController: UIViewController, StoryBoarded {
    @IBOutlet weak var symptomsTableView: UITableView!
    @IBOutlet weak var mainButton: UIButton!
    weak var coordinator: MainCoordinator?
    var symptomData = DataRetriever().sampleSymtomsData
    var data = DataRetriever().sampleDiagnosisData
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Diagnosis"
        setButton()
        self.refreshData(data: data)
    }
    /// `Refreshes / updates the tableView with the data`
    /// - Parameter data: data (Diagnosis)
    func refreshData(data: [DiagnosisElement] ) {
        self.data = data
        self.symptomsTableView.reloadData()
    }
    /// `Sets button attributes`
    func setButton() {
        self.mainButton.backgroundColor = .darkGray
        self.mainButton.titleLabel?.text = "Next"
        self.mainButton.layer.cornerRadius = self.mainButton.frame.size.height / 2
        self.mainButton.layer.masksToBounds = true
    }
    // MARK: - onNextClicked
    /// `Presents UIAlert box with "Under Development" message`
    /// - Parameter sender: UIbutton
    @IBAction func onNextClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Under development!", message: "Under development yet!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
//MARK: - UITableViewDataSource
extension DiagnosisViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiagnosisCell.identifier, for: indexPath) as! DiagnosisCell
        let data = self.data[indexPath.row]
        cell.configure(data: data)
        return cell
    }
}
// MARK: - UITableViewDelegate
extension DiagnosisViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DiagnosisViewController") as? SymptomsViewController {
            vc.title = "My Diagnosis Description"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
