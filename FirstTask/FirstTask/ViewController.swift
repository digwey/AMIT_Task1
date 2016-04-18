//
//  ViewController.swift
//  FirstTask
//
//  Created by Mohamed Digwey on 4/17/16.
//  Copyright © 2016 AMIT Org. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var savedItems = [NSManagedObject]()
    
    @IBOutlet weak var dataTableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let serviceManager = ServicesManager()
        
        serviceManager.getAllData({array,error-> Void in
            if let e = error{
                print("\(e.description)")
            }else{
                for s in array!{
                    //Fill data to core data
                    self.saveDataModel(ItemModel(dic: s as! NSDictionary))
                }
               
            }
        })
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "DataItem")
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            savedItems = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedItems.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
     
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DataCustomTableViewCell", forIndexPath: indexPath) as! DataCustomTableViewCell

        cell.userNumber.text = savedItems[indexPath.row].valueForKey("userNumber") as? String
        cell.userId.text = savedItems[indexPath.row].valueForKey("userId") as? String
        cell.userLat.text = savedItems[indexPath.row].valueForKey("latitude") as? String
        cell.userLang.text = savedItems[indexPath.row].valueForKey("langtitude") as? String
        cell.userAddress.text = savedItems[indexPath.row].valueForKey("address") as? String
        
        return cell
    }
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
            if editingStyle == .Delete {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let moc = appDelegate.managedObjectContext
            moc.deleteObject(savedItems[indexPath.row])
            appDelegate.saveContext()
            savedItems.removeAtIndex(indexPath.row)
            dataTableView.reloadData()
            
            self.dataTableView.editing = false
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let alert = UIAlertController(title: "Update", message: "Please enter the new information.", preferredStyle: .Alert)
        
        let updateAction = UIAlertAction(title: "Update", style: .Default){(_) in
            let userNumberTextField = alert.textFields![0]
            let addressTextField = alert.textFields![1]
            self.updateEntity(indexPath.row, newUserNumber: userNumberTextField.text!, newAddress: addressTextField.text!)
            self.dataTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "User Number"
        })
        
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Address"
        })
        
        alert.addAction(updateAction)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func updateEntity(index:Int, newUserNumber: String, newAddress : String){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        savedItems[index].setValue(newUserNumber, forKey: "userNumber")
        savedItems[index].setValue(newAddress, forKey: "address")
        appDelegate.saveContext()
    }

    func saveDataModel(itemModel: ItemModel) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("DataItem",inManagedObjectContext:managedContext)
        let dataItem = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
        
        dataItem.setValue(itemModel.id, forKey: "userId")
        dataItem.setValue(itemModel.langtitude, forKey: "langtitude")
        dataItem.setValue(itemModel.latitude, forKey: "latitude")
        dataItem.setValue(itemModel.userNumber, forKey: "userNumber")
        dataItem.setValue(itemModel.address, forKey: "address")
        dataItem.setValue(itemModel.userFK, forKey: "userFK")
        
        do {
            try managedContext.save()
            savedItems.append(dataItem)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func editingButton(sender: AnyObject) {
        self.dataTableView.editing = true
    }
    
    
}

