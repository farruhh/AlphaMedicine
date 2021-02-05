//
//  Symptom.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/13.
//

import Foundation
// MARK: - Symptom
/// `Symtoms Data`
struct Symptom: Codable {
    var id: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
    }
}
typealias Symptoms = [Symptom]
