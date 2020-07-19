//
//  DataRepo.swift
//  Vodafone task
//
//  Created by Karem on 7/17/20.
//  Copyright © 2020 Karem. All rights reserved.
//

/*
 This Class should only contain the webservice method to call Api
 */

import Foundation
import RealmSwift

class DataRepo {
        //Should be in Constant folder in seperate file
    let url = "https://jsonplaceholder.typicode.com/users"
    let decoder = JSONDecoder()

    func fetchDataFromApi (completion: ([DataModel]) -> ()) {
          if let url = URL(string: url) {
            
            if let data = try? Data(contentsOf: url) {
                
                if let jsonData = try? decoder.decode([DataModel].self, from: data) {
                    completion(jsonData)
                    //Caching
                    DBHelper().insertOrUpdate(modelRefrence: jsonData)
            }
        }
    }
}

//Seperate in db layer


}


