//
//  DiagnosisViewController.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/09.
//

import UIKit
///`Lists all the proposed symptoms/illness names `
class SymptomsViewController: UITableViewController,StoryBoarded  {
    weak var coordinator: MainCoordinator?
    var symptomData = DataRetriever().sampleSymtomsData
    var filteredTableData = [Any]()
    var resultSearchController = UISearchController()
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UISearchController
        //        resultSearchController = ({
        //            let controller = UISearchController(searchResultsController: nil)
        //            controller.searchResultsUpdater = self
        //            controller.searchBar.sizeToFit()
        //            tableView.tableHeaderView = controller.searchBar
        //
        //            return controller
        //        })()
        
        self.refreshData(data: symptomData)
    }
    /// `Refreshes / updates the tableView with the data`
    /// - Parameter data: symptomData
    func refreshData(data: [Symptom]) {
        self.symptomData = data
        self.tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (resultSearchController.isActive) {
            return filteredTableData.count
        } else {
            return symptomData.count
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:SymtomsCell.identifier) as! SymtomsCell
        if  (resultSearchController.isActive) {
            cell.textLabel?.text = filteredTableData[indexPath.row] as? String
        } else {
            let data = self.symptomData[indexPath.row]
            cell.configure(data: data)
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        default:
            if let vc = self.storyboard?.instantiateViewController(identifier: "DiagnosisViewController") as? DiagnosisViewController {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
// MARK: -UISearchBarDelegate
// UISearchController delegate method for filtering and udating the search results
extension SymptomsViewController: UISearchResultsUpdating {
    /// `Sorts and Filter the user search string to match and display the data using NSPridicate and updates the tableView data`
    /// - Parameter searchController: UISearchController
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (symptomData as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        self.tableView.reloadData()
    }
}
