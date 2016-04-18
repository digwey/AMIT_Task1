//
//  ItemModel.swift
//  FirstTask
//
//  Created by Mohamed Digwey on 4/17/16.
//  Copyright © 2016 AMIT Org. All rights reserved.
//

import UIKit

class ItemModel {
    
    // MARK: Properties
    var id: String
    var langtitude: String
    var latitude: String
    var userNumber: String
    var address: String
    var userFK: String
    
    
    // MARK: Initialization
    //Make it as failable initializer to can return nil when initialization
    init?(id: String, langtitude: String, latitude: String, userNumber: String, address: String, userFK: String) {
        // Initialize stored properties.
        self.id = id
        self.langtitude = langtitude
        self.latitude = latitude
        self.userNumber = userNumber
        self.address = address
        self.userFK = userFK
        
        if(id == "0"){
            return nil
        }
    }
    //Using this initializer to parse JSON from NSDictionary to data model
    init(dic: NSDictionary)
    {
        self.id = (dic["id"] as? String)!
        self.langtitude = (dic["langtitude"] as? String)!
        self.latitude = (dic["latitude"] as? String)!
        self.userNumber = (dic["userNumber"] as? String)!
        self.address = (dic["address"] as? String)!
        self.userFK = (dic["userFK"] as? String)!
    }

}
