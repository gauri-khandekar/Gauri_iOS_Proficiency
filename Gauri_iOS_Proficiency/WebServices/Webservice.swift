//
//  Webservice.swift
//  Gauri_iOS_Proficiency
//
//  Created by test on 27/12/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import Alamofire

class Webservice: NSObject {
    
    static let shared = Webservice()
    
    func getData(with url: String, completion:@escaping (_ data: Country_DataModel?, _ error: Error?) -> Void) {
        
        Alamofire.request(url).responseData { (responseData) in
            switch responseData.result {
            case .success(let data):
                
                //Apply string encoding as response is not UTF 8 formatted
                let string = String(decoding: data, as: UTF8.self)
                if let datastr = string.data(using: String.Encoding.utf8) {
                    //Map response data into model
                    do {
                        let countryData = try JSONDecoder().decode(Country_DataModel.self, from: datastr)
                        completion(countryData, nil)
                    } catch let error as NSError {
                        print(error)
                        completion(nil, error)
                    }
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
