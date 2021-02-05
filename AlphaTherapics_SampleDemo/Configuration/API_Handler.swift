//
//  API_Handler.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/09.
//

import Foundation

/// `Stores all the API data and endpoints`
class API_Handler {
    static let symptomURL = "https://rapidapi.com/priaid/api/symptom-checker?endpoint=589879a3e4b008782db6760c"
    static let path = Bundle.main.path(forResource: "Diagnosis", ofType: "json")
    static func getGeneralSymptoms() -> String {
        return path!
    }
}
