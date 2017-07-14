//
//  ViewController.swift
//  FIRDBExample
//
//  Created by Dhruvin Gajjar on 7/14/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var refArtists: DatabaseReference!
    
    @IBOutlet weak var tableArtists: UITableView!
    @IBOutlet weak var artistName: UITextField!
    @IBOutlet weak var artistGenre: UITextField!
    @IBOutlet weak var messageLbl: UILabel!
    
    var artistList = [artistModel]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!CustomTableViewCell
        
        let artist: artistModel
        artist = artistList[indexPath.row]
        cell.nameLbl.text = artist.name
        cell.genreLbl.text = artist.genre
        
        return cell
    }
    
    @IBAction func addArtistBtn(_ sender: UIButton) {
        addArtists()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        FirebaseApp.configure()
        
        refArtists = Database.database().reference().child("artists")
        
        refArtists.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.artistList.removeAll()
                for artists in snapshot.children.allObjects as! [DataSnapshot] {
                    let artistObject = artists.value as? [String: AnyObject]
                    let artistName = artistObject?["artistName"]
                    let artistGenre = artistObject?["artistGenre"]
                    let artistId = artistObject?["id"]
                    
                    let artist = artistModel(id: artistId as! String?, name: artistName as! String?, genre: artistGenre as! String?)
                    
                    self.artistList.append(artist)
                }
                self.tableArtists.reloadData()
                
            }
        })
        
    }
    
    func addArtists() {
        let key = refArtists.childByAutoId().key
        let artists = ["id": key, "artistName": artistName.text! as String, "artistGenre": artistGenre.text! as String]
        
        refArtists.child(key).setValue(artists)
        messageLbl.text = "Artist Added"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

