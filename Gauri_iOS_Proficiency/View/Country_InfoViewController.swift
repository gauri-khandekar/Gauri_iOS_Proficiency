//
//  Country_InfoViewController.swift
//  Gauri_iOS_Proficiency
//
//  Created by test on 27/12/19.
//  Copyright © 2019 test. All rights reserved.
//
import Foundation
import UIKit
import SnapKit
import PINRemoteImage
import Alamofire

class Country_InfoViewController: UIViewController {
    
    var tableView: UITableView?
    var refreshControl: UIRefreshControl?

    var countryViewModel: Country_ViewModel?
    var countryData: Country_DataModel? {
        
        didSet {
            guard let countryData = countryData else { return }
            countryViewModel = Country_ViewModel.init(countrydata: countryData)
                DispatchQueue.main.async {
                    self.updateView()
                }
            }
    }
        
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //View LifeCycle
    override func viewWillAppear(_ animated: Bool) {
    
        self.fetchData()
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 75.0
    }
    
    func setupViews() {
         view.backgroundColor = .blue
        
        //TableView UI
        tableView = UITableView.init(frame: view.bounds)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        tableView?.clipsToBounds = true
        tableView?.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 54.0
        
        tableView?.register(Country_InfoCell.self, forCellReuseIdentifier: "Country_InfoCellID")
        tableView?.accessibilityIdentifier = "table--countryInfoTableView"

        //Add refresh control for pull to refresh purpose
        self.refreshControl = UIRefreshControl.init()
        self.refreshControl?.addTarget(self, action: #selector(Country_InfoViewController.fetchData), for: .valueChanged)
        self.tableView?.addSubview(refreshControl!)
        self.tableView?.allowsSelection = false
        
        setupLayout()
    }
    
    func setupLayout() {
        tableView?.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view); // to make table size same as view
        }
    }

    @objc func fetchData() {
        if isConnectedToInternet() == true {
            Webservice.shared.getData(with: webserviceURL) { (countryData, error) in
                self.refreshControl?.endRefreshing()
                if error != nil {
                    return
                }
                guard let countryData = countryData else {return}
                self.countryData = countryData
            }
        } else {
            showAlert(title: "Opps!!! Lost Internet Connection !", message: "Please check your Connectivity !!!")
        }
    }
    
    func updateView() {
        self.title = self.countryViewModel?.title
        self.tableView?.reloadData()
    }
}
