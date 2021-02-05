//
//  ServerCommunicator.swift
//  AlphaTherapics_SampleDemo
//
//  Created by frank on 2020/11/09.
//

import Foundation
import Alamofire
import PromiseKit
import SwiftyJSON

/// `Data Fetcher - Func Manager Class which holds all the remote requests func`
class ServerCommunicator {
    //    static func getSymptom() -> Promise<Response<GeneralSymptoms>> {
    //        let decoder =  JSONDecoder()
    //        decoder.dateDecodingStrategy = .millisecondsSince1970
    //        return Promise { seal in
    //            AF.request(API_Handler.getGeneralSymptoms()).responseDecodable(of: Response<GeneralSymptoms>.self, decoder: decoder) { response in
    //                switch response.result {
    //                case .success(let val):
    //                    return seal.fulfill(val)
    //                case .failure(let err):
    //                    return seal.reject(err)
    //                }
    //            }
    //        }
    //    }

}
