//
//  Country_InfoDataModel.swift
//  Gauri_iOS_Proficiency
//
//  Created by test on 27/12/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

struct Country_InfoDataModel: Codable {
    var title: String?
    var description: String?
    var imageHref: String?
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case imageHref
    }
}
