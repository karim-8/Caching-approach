//
//  ItemsViewodel.swift
//  Vodafone task
//
//  Created by Karem on 7/17/20.
//  Copyright © 2020 Karem. All rights reserved.
//

//we will seperate the logic from the view controller

import Foundation

class ItemsViewModel:NSObject {
    //repo refrence
    var repoObject = DataRepo()
    //array will contain the data
    var AnzamaDataArray = [DataObjects]()
    
    func fetchDataFromRepo (completion:() -> ()) {
    // call repo method to fetch data from api
        repoObject.fetchDataFromApi { users in
            self.AnzamaDataArray = users
            completion()
            print(self.AnzamaDataArray)

        }
    }
    
    // return items inside sections
    // return items title
}
