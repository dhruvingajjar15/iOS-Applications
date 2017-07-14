//
//  CustomTableViewCell.swift
//  focusFirebaseChallenge
//
//  Created by Dhruvin Gajjar on 7/13/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
