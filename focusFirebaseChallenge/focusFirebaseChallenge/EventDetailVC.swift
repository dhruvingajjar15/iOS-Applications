//
//  EventDetailVC.swift
//  focusFirebaseChallenge
//
//  Created by Dhruvin Gajjar on 7/13/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit

class EventDetailVC: UIViewController {

    var event: Event? = nil
    var indexPath: IndexPath? = nil
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventName.text = event?.name
        priceLbl.text = event?.price
        addressLbl.text = event?.address
        dateLbl?.text = "\(String(describing: event?.date))"
        // Do any additional setup after loading the view.
    }

    @IBAction func done(_ sender: Any) {
        performSegue(withIdentifier: "unwindToEventList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editEvent" {
            guard let viewController = segue.destination as? AddEventVC else { return }
            viewController.titleText = "Edit Event"
            viewController.event = event
            viewController.indexPathForEvent = self.indexPath
        }
    }

}
