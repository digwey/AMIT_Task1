//
//  ServicesManager.swift
//  FirstTask
//
//  Created by Mohamed Digwey on 4/17/16.
//  Copyright © 2016 AMIT Org. All rights reserved.
//


import UIKit

typealias ServiceResponse = (NSArray?, NSError?) -> Void

class ServicesManager: NSObject {

    override init() {
       
    }
    
    func getAllData(serviceResponse: ServiceResponse){
        ConnectivityManager.makeHTTPGetRequest("http://amit-learning.com/parkForMe/index.php",onCompletion: { dic, error-> Void in
            if let e = error{
                serviceResponse(nil,e)
            }else{
                serviceResponse(dic!["data"] as? NSArray,nil)
            }
            
            
        })
       
    }
}
