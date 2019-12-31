//
//  Country_InfoVC-Extension+TableViewDataSource.swift
//  Gauri_iOS_Proficiency
//
//  Created by test on 27/12/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

extension Country_InfoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countryViewModel?.info.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var countryInfoCell: Country_InfoCell? = tableView.dequeueReusableCell(withIdentifier: countryInfoCellId, for: indexPath) as? Country_InfoCell
        
        if countryInfoCell == nil {
            countryInfoCell = Country_InfoCell.init(style: .default, reuseIdentifier: countryInfoCellId)
        }
        
       countryInfoCell?.Country_InfoViewModel = Country_InfoViewModel.init(countryInfoData: (countryViewModel?.info[indexPath.section])!)
        
        countryInfoCell?.layoutIfNeeded()
        countryInfoCell?.layoutSubviews()
        return countryInfoCell!
    }
}
