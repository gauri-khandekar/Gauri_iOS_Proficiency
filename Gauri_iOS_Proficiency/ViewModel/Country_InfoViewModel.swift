//
//  Country_InfoViewModel.swift
//  Gauri_iOS_Proficiency
//
//  Created by test on 27/12/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit

class Country_InfoViewModel: NSObject {
    var countryInfoData: Country_InfoDataModel?
    
    var titleText: String {
        return countryInfoData!.title ?? "No Title"
    }
    
    var desctiptionText: NSAttributedString {
        
        let descriptionString = countryInfoData?.description ?? "No Extra Information Available on this" //?? "No Description"
        let attributes: [NSAttributedString.Key: Any] = [ .font: UIFont.italicSystemFont(ofSize: 16.0), .foregroundColor: UIColor.darkGray]
        
        let descriptionAttributedString =  NSMutableAttributedString.init(string: descriptionString, attributes: attributes)
        
        return descriptionAttributedString
    }
    
    var imageHrefUrl: URL? {
        if let imgHrefUrl = countryInfoData?.imageHref {
            // To convert string into URL
            if let url = URL.init(string: imgHrefUrl) {
                return url
            }
        }
        return nil
    }

    init(countryInfoData: Country_InfoDataModel) {
        self.countryInfoData = countryInfoData
    }
}
