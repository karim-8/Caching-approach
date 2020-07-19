//
//  DBHelper.swift
//  Vodafone task
//
//  Created by Karem on 7/19/20.
//  Copyright © 2020 Karem. All rights reserved.
//

import Foundation
import RealmSwift

class DBHelper {
    
    let realm = try! Realm()

    
    func insertOrUpdate(modelRefrence: [DataModel]) {
       try! realm.write({
               realm.add(modelRefrence)
           })
    }
    
}
