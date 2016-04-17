//
//  DataCustomTableViewCell.swift
//  FirstTask
//
//  Created by Mohamed Digwey on 4/17/16.
//  Copyright © 2016 AMIT Org. All rights reserved.
//

import UIKit

class DataCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var userAddress: UILabel!
    @IBOutlet weak var userNumber: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userLang: UILabel!
    
    @IBOutlet weak var userLat: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
