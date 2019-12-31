//
//  Country_DataModel.swift
//  Gauri_iOS_Proficiency
//
//  Created by test on 27/12/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

struct Country_DataModel: Codable {
    var title: String?
    var info: [Country_InfoDataModel]?
    
    enum CodingKeys: String, CodingKey {
        case title
        case info = "rows"
    }
}
