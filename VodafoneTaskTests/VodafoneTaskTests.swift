//
//  VodafoneTaskTests.swift
//  VodafoneTaskTests
//
//  Created by Karem on 7/17/20.
//  Copyright © 2020 Karem. All rights reserved.
//

import XCTest
@testable import Vodafone_task

class VodafoneTaskTests: XCTestCase {

    override func setUp() {
        print("Before Test")
    }

  

    func testExample() {
        let viewController = ViewController()
        let actualValue = viewController.test(x: 5)
        XCTAssertEqual(actualValue, 25)
    }
    
    var listName = ""
    var listFirstName = "Leanne Graham"

    func testViewModel () {
        //Repo instance
        let webservice = DataRepo()
        //call api
        webservice.fetchDataFromApi { (users) in
            self.listName = users[0].name
        }
        
        XCTAssertEqual(listFirstName, listName)
        // check whether value nil or Not
        //XCTAssertNil(listName)
        
    }
    override func tearDown() {
          print("After Test")

      }
  

}
