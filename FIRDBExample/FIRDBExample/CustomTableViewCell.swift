//
//  CustomTableViewCell.swift
//  FIRDBExample
//
//  Created by Dhruvin Gajjar on 7/14/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
