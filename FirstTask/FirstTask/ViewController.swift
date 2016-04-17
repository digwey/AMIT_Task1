//
//  ViewController.swift
//  FirstTask
//
//  Created by Mohamed Digwey on 4/17/16.
//  Copyright © 2016 AMIT Org. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var dataItems = [ItemModel]()
    
    @IBOutlet weak var dataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let serviceManager = ServicesManager()
        
        serviceManager.getAllData({array,error-> Void in
            if let e = error{
                print("\(e.description)")
            }else{
                for s in array!{
                    self.dataItems.append(ItemModel(dic: s as! NSDictionary))
                }
                dispatch_async(dispatch_get_main_queue(),{
                    self.dataTableView.reloadData()
                })
            }
        })

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataItems.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell:UITableViewCell = self.dataTableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = "\(self.dataItems[indexPath.row].id)"
        return cell
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

