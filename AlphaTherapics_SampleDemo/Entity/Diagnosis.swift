//
//  Diagnosis.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/12.
//

import Foundation

// MARK: - DiagnosisElement
/// Diagnosis Data
struct DiagnosisElement: Codable {
    var issue: Issue?
    var specialisation: [Specialisation]?
    
    enum CodingKeys: String, CodingKey {
        case issue = "Issue"
        case specialisation = "Specialisation"
    }
}
// MARK: - Issue
struct Issue: Codable {
    var id: Int?
    var name: String?
    var accuracy: Double?
    var icd, icdName, profName: String?
    var ranking: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case accuracy = "Accuracy"
        case icd = "Icd"
        case icdName = "IcdName"
        case profName = "ProfName"
        case ranking = "Ranking"
    }
}
// MARK: - Specialisation
struct Specialisation: Codable {
    var id: Int?
    var name: String?
    var specialistID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case specialistID = "SpecialistID"
    }
}

typealias Diagnosis = [DiagnosisElement]
