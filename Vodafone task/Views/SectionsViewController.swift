//
//  SectionsViewController.swift
//  Vodafone task
//
//  Created by Karem on 7/15/20.
//  Copyright © 2020 Karem. All rights reserved.
//

import UIKit

struct cellDataView {
    var isOpen = Bool()
    var title = String()
    var sectionCellData = [String]()
}

class SectionsViewController: UITableViewController {

    var dataTableView = [cellDataView]()
    
    override func viewDidLoad() {
    //Fill the array to fill table view sections & cells
        dataTableView = [
            
        cellDataView(isOpen: false, title: "Karim One",
        sectionCellData: ["First","Second","Third"]),
        
        cellDataView(isOpen: false, title: "Karim Two",
        sectionCellData: ["77","777","7777"]),
        
        cellDataView(isOpen: false, title: "Karim Three",
        sectionCellData: ["999","999999","999999999"])
        
        ]
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none

        
    }
    
    //How Many section i want
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataTableView.count
    }
    
    
    //How Many Lines inside each Section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //so i have to check if isOpen value true so return the cells inside , if false return one cell
        if dataTableView[section].isOpen == true {
           // it start from 1 so i add 1 to the couunt
        return dataTableView[section].sectionCellData.count + 1
        }else {
            return 1
        }
    }

    //What is the cell shape you want
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //i have 2 types of cell one closed & one in case opened items
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = dataTableView[indexPath.section].title
            cell.textLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)

                   return cell
        }else {
            //cells that will be inside each section
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            //here i minus one cause it starts from 0
            cell.textLabel?.text = dataTableView[indexPath.section].sectionCellData[indexPath.row - 1]
                   return cell
        }
    }
    
    //When user click over cell what should be done
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // 1 - if it's opened collapse them & visa verses
        // 2 - Then reload the sections
        //define section
        let section = IndexSet.init(integer: indexPath.section)
        
        if dataTableView[indexPath.section].isOpen == true {
            
            dataTableView[indexPath.section].isOpen = false
            let section = IndexSet.init(integer: indexPath.section)

            tableView.reloadSections(section, with: .none)
            
        }else {
            let section = IndexSet.init(integer: indexPath.section)

            dataTableView[indexPath.section].isOpen = true
            tableView.reloadSections(section, with: .none)
        }
    }
}
