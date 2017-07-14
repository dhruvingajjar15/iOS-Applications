//
//  EventTableVC.swift
//  focusFirebaseChallenge
//
//  Created by Dhruvin Gajjar on 7/13/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit

class EventTableVC: UITableViewController {

    var events = [Event]()
    let dateFormatter = DateFormatter()
    let locale = Locale.current
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //set more date formatter setting
        dateFormatter.locale = locale
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        // Load events
        if let saveEvents = loadEvents() {
            events += saveEvents
        }
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    //Need to take care of image view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! CustomTableViewCell

        let event = events[indexPath.row]
        cell.nameLbl?.text = event.name
        cell.dateLbl?.text = dateFormatter.string(from: event.date as Date)
        //cell.eventImage?.image = (event.image) as? String
        return cell
    }
 


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let toRemove = events.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveEvents()
        }   
    }
    
    @IBAction func unwindToEventList(sender: UIStoryboardSegue) {
        if let sourceView = sender.source as? AddEventVC, let event = sourceView.event  {
            //Add a new event
            let newIndexPath = NSIndexPath(row: events.count, section: 0)
            if let indexPath = sourceView.indexPathForEvent {
                events[indexPath.row] = event
            } else {
                events.append(event)
            }
            tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
            saveEvents()
            tableView.reloadData()
        }
    }
 
    
    //Mark:- NSCoding
    func saveEvents() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(events, toFile: Event.ArchiveURL.path)
        if (isSuccessfulSave) {print("Saved event successfully")}
        else {print("Failed to save event")}
    }
    
    func loadEvents() -> [Event]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Event.ArchiveURL.path) as? [Event]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eventDetail" {
            guard let navController = segue.destination as? UINavigationController else{ return }
            guard let viewController = navController.topViewController as? EventDetailVC else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let event = events[indexPath.row]
            viewController.event = event
           
            
        }
    }
    

}







