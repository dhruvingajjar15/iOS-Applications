//
//  CustomTableViewCell.swift
//  focusSwiftChallenge
//
//  Created by Dhruvin Gajjar on 7/12/17.
//  Copyright © 2017 Dhruvi Gajjar. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var flagLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
