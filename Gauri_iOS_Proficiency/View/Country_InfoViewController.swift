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
    
    //ViewController Initialization with different required components.
    
    //The Main Table View which will hold the whole JSON in Custom Cells.
    var tableView: UITableView?
    //The Refresh control handles the data reloading.
    
    var waitLabel : UILabel?
    var refreshControl: UIRefreshControl?
    //View Model Class object is initialized with country view model.
    var countryViewModel: Country_ViewModel?
    //Data Model class Obejct is initialized.
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
        //tableView?.estimatedRowHeight = 40.0
    }
    
    //This method sets up the view with components and their properties.
    func setupViews() {
          view.backgroundColor = .white
                
                waitLabel = UILabel.init(frame: view.bounds)
               // waitLabel?.backgroundColor = .
                waitLabel?.text = "Please Wait ..."
                waitLabel?.isHidden = false
                waitLabel?.textAlignment = .center
                self.view .addSubview(waitLabel!)
        
        //TableView UI
        tableView = UITableView.init(frame: view.bounds)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        tableView?.clipsToBounds = true
        tableView?.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView?.rowHeight = UITableView.automaticDimension
        //tableView?.estimatedRowHeight = 65.0
        
        //Table view registry with custom cells
        tableView?.register(Country_InfoCell.self, forCellReuseIdentifier: "Country_InfoCellID")
        tableView?.accessibilityIdentifier = "table--countryInfoTableView"

        //Add refresh control for pull to refresh purpose
        self.refreshControl = UIRefreshControl.init()
        self.refreshControl?.addTarget(self, action: #selector(Country_InfoViewController.fetchData), for: .valueChanged)
        self.tableView?.addSubview(refreshControl!)
        self.tableView?.allowsSelection = false
        self.tableView?.isHidden = true
        
        setupLayout()
    }
    
    func setupLayout() {
        tableView?.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view); // to make table size same as view
        }
    }
    //Function retrieves data from web service URL.
    @objc func fetchData() {
        if isConnectedToInternet() == true {
            Webservice.shared.getData(with: webserviceURL) { (countryData, error) in
                self.refreshControl?.endRefreshing()
                if error != nil {
                    return
                }
                guard let countryData = countryData else {return}
                self.countryData = countryData
                self.tableView?.reloadData()
                self.tableView?.isHidden = false
                self.waitLabel?.isHidden = true
            }
        } else {
            showAlert(title: "Opps!!! Lost Internet Connection !", message: "Please check your Connectivity !!!")
        }
    }
    
    func updateView() {
        self.title = self.countryViewModel?.title
        self.tableView?.reloadData()
    }
    
    // To check whether any object contains nil.
//    func reFineData()
//    {
//        var infoArray = self.countryData?.info
//        for (title,description,imageHref) in infoArray{
//
//
//        }
//    }

}

