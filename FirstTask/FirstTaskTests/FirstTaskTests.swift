//
//  FirstTaskTests.swift
//  FirstTaskTests
//
//  Created by Mohamed Digwey on 4/17/16.
//  Copyright © 2016 AMIT Org. All rights reserved.
//

import XCTest
@testable import FirstTask

class FirstTaskTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    func testInitDataModel(){
        //Generating Nil Item model
        let itemModel = ItemModel(id: "0", langtitude: "Lan", latitude: "lat", userNumber: "UN", address: "Address", userFK: "UFK")
        
        
        //It should be success because item Model with negative ID generate nil Model
        XCTAssertNil(itemModel)
        
        //Successfully generated Sector model
        let itemModelSuccessed = ItemModel(id: "1", langtitude: "Lan", latitude: "lat", userNumber: "UN", address: "Address", userFK: "UFK")
        
        //Test to insure mapping between model consturctor and model properties
        XCTAssertEqual(itemModelSuccessed!.id,"1")
        XCTAssertEqual(itemModelSuccessed!.langtitude,"Lan")
        XCTAssertEqual(itemModelSuccessed!.latitude,"lat")
        XCTAssertEqual(itemModelSuccessed!.userNumber,"UN")
        XCTAssertEqual(itemModelSuccessed!.address,"Address")
        XCTAssertEqual(itemModelSuccessed!.userFK,"UFK")
    }

}
