//
//  Country_ViewModel.swift
//  Gauri_iOS_Proficiency
//
//  Created by test on 27/12/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit

class Country_ViewModel: NSObject {
    var countryData: Country_DataModel?
    
    var title: String {
        return countryData?.title ?? "No Title"
    }
    
    var info: [Country_InfoDataModel] {
        
        return countryData?.info ?? []
    }
    
    init(countrydata: Country_DataModel) {
        self.countryData = countrydata
    }
}
