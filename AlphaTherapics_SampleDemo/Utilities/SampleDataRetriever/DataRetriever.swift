//
//  DataRetriever.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/12.
//

import Foundation

/// `Sample DataLoader Class which imitates the real- time DataFetch from the remote API while fetching the local Data`
public class DataRetriever {
    @Published var sampleDiagnosisData = [DiagnosisElement]()
    @Published var sampleSymtomsData = [Symptom]()
    /// Initializer
    init() {
        loadDiagnosis()
        loadSymtoms()
    }
    /// `Fetch Diagnosis data`
    func loadDiagnosis() {
        if let localPath = Bundle.main.url(forResource: "diagnosis", withExtension: "json") {
            do {
                let data = try Data(contentsOf: localPath)
                let decoder = JSONDecoder()
                let retrievedData = try decoder.decode([DiagnosisElement].self, from: data)
                self.sampleDiagnosisData = retrievedData
            }
            catch {
                print(error)
            }
        }
    }
    ///`Fetch Symptoms Data`
    func loadSymtoms() {
        if let localPath = Bundle.main.url(forResource: "issues", withExtension: "json") {
            do {
                let data = try Data(contentsOf: localPath)
                let decoder = JSONDecoder()
                let retrievedData = try decoder.decode([Symptom].self, from: data)
                self.sampleSymtomsData = retrievedData
            }
            catch {
                print(error)
            }
        }
    }
}
