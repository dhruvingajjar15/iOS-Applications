//
//  PlayersVC.swift
//  focusSwiftChallenge
//
//  Created by Dhruvin Gajjar on 7/12/17.
//  Copyright © 2017 Dhruvi Gajjar. All rights reserved.
//

import UIKit
import CoreData

class PlayersVC: UITableViewController {
    
    var players: [NSManagedObject] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        tableView.reloadData()
    }
    
    //Mark: Data Source
    
    func fetch() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        do {
            players = try managedObjectContext.fetch(fetchRequest) as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch. \(error)")
        }
    }
    
    func save(name: String, country: String, height: String, weight: String, age: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Player", in: managedObjectContext) else { return }
        let player =  NSManagedObject(entity: entity, insertInto: managedObjectContext)
        player.setValue(name, forKey: "name")
        player.setValue(country, forKey: "country")
        player.setValue(height, forKey: "height")
        player.setValue(weight, forKey: "weight")
        player.setValue(age, forKey: "age")
        
        do {
            try managedObjectContext.save()
            self.players.append(player)
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }
    
    func update(indexPath: IndexPath, name: String, country: String, height: String, weight: String, age: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let player = players[indexPath.row]
        player.setValue(name, forKey: "name")
        player.setValue(country, forKey: "country")
        player.setValue(height, forKey: "height")
        player.setValue(weight, forKey: "weight")
        player.setValue(age, forKey: "age")
        
        do {
            try managedObjectContext.save()
            players[indexPath.row] = player
        } catch let error as NSError {
            print("Could not update. \(error)")
        }
        
    }
    
    func delete(_ player: NSManagedObject, at indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        managedObjectContext.delete(player)
        players.remove(at: indexPath.row)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let player = players[indexPath.row]
        cell.nameLbl.text = (player.value(forKey: "name") as! String)
        cell.flagLbl.text = (player.value(forKey: "country") as! String)
        cell.ageLbl.text = (player.value(forKey: "age") as! String)
        
        return cell
    }
    //Mark:- Navigation
    //Unwind Segue
    @IBAction func unwindToPlayerList(segue: UIStoryboardSegue) {
        if let viewController = segue.source as? AddPlayerVC {
            guard let name:String = viewController.nameText.text,
                let countryFlag:String = viewController.countryText.text,
                let age:String = viewController.ageText.text,
                let height:String = viewController.heightText.text,
                let weight:String = viewController.weightText.text else { return }
            if name != "" && countryFlag != "" && age != "" && height != "" && weight != "" {
                if let indexPath = viewController.indexPathForPlayer {
                    update(indexPath: indexPath, name: name, country: countryFlag, height: height, weight: weight, age: age)
                } else{
                    save(name: name, country: countryFlag, height: height, weight: weight, age: age)
                }
            }
             tableView.reloadData()
        }
        else if let viewController = segue.source as? PlayerDetailVC {
            if viewController.isDeleted {
                guard let indexPath: IndexPath = viewController.indexPath else { return }
                let player = players[indexPath.row]
                delete(player, at: indexPath)
                tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playerDetail" {
            guard let navController = segue.destination as? UINavigationController else{ return }
            guard let viewController = navController.topViewController as? PlayerDetailVC else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let player = players[indexPath.row]
            viewController.player =  player
            viewController.indexPath = indexPath
        }
    }

}
