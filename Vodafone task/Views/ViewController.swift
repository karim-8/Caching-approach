//
//  ViewController.swift
//  Vodafone task
//
//  Created by Karem on 7/12/20.
//  Copyright © 2020 Karem. All rights reserved.
//

import UIKit
import RealmSwift

struct cellDataViewItems {
    var isOpen = Bool()
    var title = String()
    var sectionCellData = [String]()
}



class ViewController: UIViewController {
   // var dataTableView = [cellDataViewItems]()

    //MARK:- Outlets
    @IBOutlet weak var firstLabel:UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var horizontalDivider: UIView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var showOrHideItemsLabel: UILabel!
    @IBOutlet var dropDownItems: [UILabel]!
    @IBOutlet weak var outerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var MytableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    //MARK:- Variables
    let screenSize:CGRect = UIScreen.main.bounds
    var cellHeaderName = "See More"
    var viewModel = ItemsViewModel()
    let realm = try! Realm()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        getData()

    }
    
    //MARK:- Setup the layout before initilaze screen
    func setupLayout () {
 
        //check over internet connection
        viewModel.moniterNetworkConnection()
        print("Value inside VC \(viewModel.moniterNetworkConnection())")
        //printing the database refrence
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        //Remove seperators from TableView
        self.MytableView.separatorStyle = UITableViewCellSeparatorStyle.none
        secondLabel.layer.cornerRadius = 3
        secondLabel.layer.borderWidth = 2
        secondLabel.layer.borderColor = UIColor.darkGray.cgColor
        horizontalDivider.frame.size.height = 1
    }
    
    //MARK:- Fetch data from Api
    func getData() {
        viewModel.fetchDataFromRepo {
            MytableView.reloadData()
        }
    }
}


extension Int {
    
    func test (x:Int) -> Int {
        x * x
    }
    //Overloading method
    func test (x:Int,y:Int) -> Int {
        x * x
    }
}
