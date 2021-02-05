//
//  Response.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/09.
//

import Foundation

/// `Generic Response Manager`
struct Response<T: Codable>: Codable {
    var data: [T]?
} 
