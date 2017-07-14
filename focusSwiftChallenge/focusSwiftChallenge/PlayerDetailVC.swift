//
//  PlayeDetailVC.swift
//  focusSwiftChallenge
//
//  Created by Dhruvin Gajjar on 7/12/17.
//  Copyright © 2017 Dhruvi Gajjar. All rights reserved.
//

import UIKit
import CoreData

class PlayerDetailVC: UIViewController {

    var player: NSManagedObject? = nil
    var isDeleted: Bool = false
    var indexPath: IndexPath? = nil
    
    @IBOutlet weak var theNameLbl: UILabel!
    @IBOutlet weak var theFlagLbl: UILabel!
    @IBOutlet weak var theHeightLbl: UILabel!
    @IBOutlet weak var theWeightLbl: UILabel!
    @IBOutlet weak var theAgeLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        theNameLbl.text = player?.value(forKey: "name") as? String
        theFlagLbl.text = player?.value(forKey: "country") as? String
        theHeightLbl.text = player?.value(forKey: "height") as? String
        theWeightLbl.text = player?.value(forKey: "weight") as? String
        theAgeLbl.text = player?.value(forKey: "age") as? String
    }

    @IBAction func done(_ sender: Any) {
        performSegue(withIdentifier: "unwindToPlayerList", sender: self)
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        isDeleted = true
        performSegue(withIdentifier: "unwindToPlayerList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editDetails" {
            guard let viewController = segue.destination as? AddPlayerVC else { return }
            viewController.titleText = "Edit Player Details"
            viewController.player = player
            viewController.indexPathForPlayer = self.indexPath!
        }
    }
}
