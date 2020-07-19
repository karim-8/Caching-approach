//
//  ItemsViewodel.swift
//  Vodafone task
//
//  Created by Karem on 7/17/20.
//  Copyright © 2020 Karem. All rights reserved.
//

//we will seperate the logic from the view controller

import Foundation
import Network
import RealmSwift


class ItemsViewModel:NSObject {
    
    //Realm Array refrence
    var names: [Results<DataModel>]?
    
    //var areas: List<Area>

    
    //Realm refrence
    let realm = try! Realm()
    //Netwrok current status
    var networkStatus : Bool?
    //repo refrence
    var repoObject = DataRepo()
    //array will contain the data
    var AnzamaDataArray = [DataModel]()
    
    func fetchDataFromRepo (completion:() -> ()) {
        //check connection if is there internet go to api call
        //if no internet fetch through the DB
        
        if networkStatus == false {
            // call repo method to fetch data from api
                  repoObject.fetchDataFromApi { users in
                      self.AnzamaDataArray = users
                      completion()
                      //print(self.AnzamaDataArray)

                  }
        }else {
            //false case from DB
            fetchDataFromDB()
            
        }
        
  
        
        
        
    }
    //MARK:- Fetch Data from
     func fetchDataFromDB() -> [DataModel] {
          let realm = try! Realm()
          let realmResults = realm.objects(DataModel.self)
          let changeToArr:[DataModel] = Array(realmResults)
          self.AnzamaDataArray = changeToArr
          print("Amrrrr \(changeToArr)")
          return changeToArr

      }
    
    
    //MARK:- Check Network Connection
    func moniterNetworkConnection () {
        //var  = false
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("There is a Network connection")
                self.networkStatus = true
            }else {
                print("There is NoooOOOOooo Network connection")
                self.networkStatus = false
            }
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
    }
    
    // return items inside sections
    // return items title
}





//extension Results {
//
//    func toArray<T>() -> [T] {
//        return self.map{$0} as! [T]
//    }
//}

extension RealmSwift.List {

    func toArray<T>() -> [T] {
        return self.map{$0} as! [T]
    }
}


//Realm
class RealmHelper {
//    static func saveObject<T:Object>(object: T) {
//        let realm = try! Realm()
//        try! realm.write {
//            realm.add(object)
//        }
//    }
  
    static func getObjects<T:Object>(filter:String)->[T] {
        let realm = try! Realm()
        let realmResults = realm.objects(T.self).filter(filter)
        return Array(realmResults)

    }
}
