//
//  PlaySongVC.swift
//  swappingScreen
//
//  Created by Gajjar, Dhruvin Pankajkumar on 3/16/17.
//  Copyright © 2017 Gajjar, Dhruvin Pankajkumar. All rights reserved.
//

import UIKit

class PlaySongVC: UIViewController {

    @IBOutlet weak var songTitleLbl: UILabel!
    
    private var _selectedSong: String!
    
    var selectedSong: String {
        get {
            return _selectedSong
        }
        set {
            _selectedSong = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        songTitleLbl.text = _selectedSong
    }

    

}
