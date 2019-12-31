//
//  Country_InfoVC-Extension+TableViewDelegate.swift
//  Gauri_iOS_Proficiency
//
//  Created by test on 27/12/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

extension Country_InfoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.size.width, height: 5))
        footerView.backgroundColor = UIColor.gray
        return footerView
    }

}
