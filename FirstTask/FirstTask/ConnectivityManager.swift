//
//  ConnectivityManager.swift
//  FirstTask
//
//  Created by Mohamed Digwey on 4/17/16.
//  Copyright © 2016 AMIT Org. All rights reserved.
//

import UIKit

typealias ConnectivityResponse = (NSDictionary?, NSError?) -> Void

class ConnectivityManager : NSObject {
    
     static func makeHTTPGetRequest(url: String,onCompletion: ConnectivityResponse){
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if let responseData = data {
                // parse the result as JSON, since that's what the API provides
                let post: NSDictionary
                do {
                    post = try NSJSONSerialization.JSONObjectWithData(responseData,
                        options: []) as! NSDictionary
                    onCompletion(post, error)
                } catch  {
                    print("error trying to convert data to JSON")
                    return
                }
                
            } else {
                onCompletion(nil, error)
            }
        })
        task.resume()
    }
    
}
