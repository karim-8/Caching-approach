//
//  DataRepo.swift
//  Vodafone task
//
//  Created by Karem on 7/17/20.
//  Copyright © 2020 Karem. All rights reserved.
//

import Foundation

class DataRepo {
        //Should be in Constant folder in seperate file
    let url = "https://jsonplaceholder.typicode.com/users"
    let decoder = JSONDecoder()

    func fetchDataFromApi (completion: ([DataObjects]) -> ()) {
          if let url = URL(string: url) {
            if let data = try? Data(contentsOf: url) {
                if let jsonData = try? decoder.decode([DataObjects].self, from: data) {
                    completion(jsonData)
                }
            }
        }
    }
}
