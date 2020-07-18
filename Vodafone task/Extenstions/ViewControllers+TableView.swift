//
//  ViewControllers+TableView.swift
//  Vodafone task
//
//  Created by Karem on 7/17/20.
//  Copyright © 2020 Karem. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource,UITableViewDelegate {

//func numberOfSections(in tableView: UITableView) -> Int {
//
//    return viewModel.AnzamaDataArray!.count
//
//        //dataTableView.count
//}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //so i have to check if isOpen value true so return the cells inside , if false return one cell
//        if dataTableView[section].isOpen == true {
//           // it start from 1 so i add 1 to the couunt
//        return dataTableView[section].sectionCellData.count + 1
//        }else {
//            return 1
//
//        }
    return viewModel.AnzamaDataArray.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //i have 2 types of cell one closed & one in case opened items
//    if indexPath.row == 0 {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
//        cell.textLabel?.text = cellHeaderName
//            //dataTableView[indexPath.section].title
//        cell.textLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
//
//               return cell
//    }else {
//        //cells that will be inside each section
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
//        //here i minus one cause it starts from 0
//        cell.textLabel?.text = dataTableView[indexPath.section].sectionCellData[indexPath.row - 1]
//               return cell
//    }
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
    cell.textLabel?.text = viewModel.AnzamaDataArray[indexPath.row].name
    return cell
    
    
    }
    
    

//func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//      // 1 - if it's opened collapse them & visa verses
//          // 2 - Then reload the sections
//          //define section
//
//          if dataTableView[indexPath.section].isOpen == true {
//
//            tableViewHeight.constant = 50
//            MytableView.layoutIfNeeded()
//            dataTableView[indexPath.section].isOpen = false
//            cellHeaderName = "See More"
//            MytableView.reloadData()
//            let section = IndexSet.init(integer: indexPath.section)
//
//              tableView.reloadSections(section, with: .none)
//
//          }else {
//            cellHeaderName = "See Less"
//            MytableView.reloadData()
//            tableViewHeight.constant = 300
//            MytableView.layoutIfNeeded()
//
//              let section = IndexSet.init(integer: indexPath.section)
//
//              dataTableView[indexPath.section].isOpen = true
//              tableView.reloadSections(section, with: .none)
//          }
//    }
}


extension Int {
    
    
    
    func square () -> Int {
        self * self * self
    }
    
}
