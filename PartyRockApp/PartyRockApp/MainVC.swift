//
//  ViewController.swift
//  PartyRockApp
//
//  Created by  on 4/13/17.
//  Copyright © 2017 blackfruits. All rights reserved.
//

import UIKit

class MainVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://scontent.fhou2-1.fna.fbcdn.net/v/t1.0-9/524536_401184796577205_747601710_n.jpg?oh=820433eacebee67a665026ae198865d2&oe=59973417", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/F1LVftw-eEs\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Hear Me From Heaven")
        
        let p2 = PartyRock(imageURL: "https://scontent.fhou2-1.fna.fbcdn.net/v/t1.0-9/1461835_728394123856269_1482507030_n.jpg?oh=69beb9a328b61c889c8c9d53cd929ac8&oe=59534531", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/-vIXgY4gF8o\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Change of hearts")
        
        let p3 = PartyRock(imageURL: "https://scontent.fhou2-1.fna.fbcdn.net/v/t1.0-9/1560504_758483194180695_336595863_n.jpg?oh=364d6cc24f0347d51c3bb7155da6e682&oe=5985F787", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/xUjn3zGelQo\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "The Rules")
        
        let p4 = PartyRock(imageURL: "https://scontent.fhou2-1.fna.fbcdn.net/v/t1.0-9/10378249_888190937876586_6826461528631780783_n.jpg?oh=d661e63b392092958e78c4821aec5bcb&oe=5990AE9C", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/TKn50iImE9g\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Discortion")
        
        let p5 = PartyRock(imageURL: "https://scontent.fhou2-1.fna.fbcdn.net/v/t1.0-9/320995_574272329268450_320749736_n.jpg?oh=c8713d45651115ee617e4e7fa259bc6d&oe=598ADA56", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/8upDOZ4C24M\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Ladjies and Djentlemen")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
            
        }else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
}

