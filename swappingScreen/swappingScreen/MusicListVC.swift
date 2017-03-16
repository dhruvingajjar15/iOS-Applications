//
//  MusicListVC.swift
//  swappingScreen
//
//  Created by Gajjar, Dhruvin Pankajkumar on 3/16/17.
//  Copyright © 2017 Gajjar, Dhruvin Pankajkumar. All rights reserved.
//

import UIKit

class MusicListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func backBtnpressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func load3rdScreenPressed(_ sender: Any) {
        let songTitle = "Quit Playing Games With My Heart"
        performSegue(withIdentifier: "PlaySongVC", sender: songTitle )
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaySongVC {
            
            if let song = sender as? String {
                destination.selectedSong = song
            }
        }
    }

}
