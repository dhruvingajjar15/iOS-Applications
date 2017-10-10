//
//  ViewController.swift
//  Jokes App
//
//  Created by Dhruvin Gajjar on 10/8/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if jokeLabel.text == "Label" {
            loadJokes()
        }
    }
    
    @IBAction func shareBtn(_ sender: UIButton) {
        let activityVC = UIActivityViewController(activityItems: [jokeLabel.text as Any], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    func getRandomColor() -> UIColor{
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }

    @IBAction func nextJokeBtn(_ sender: UIButton) {
        loadJokes()
        self.view.backgroundColor = getRandomColor()
    }
    
    func loadJokes() {
        Alamofire.request("http://api.icndb.com/jokes/random", method: .get).responseJSON { (response) in
            let results = response.result
            if let dict = results.value as? Dictionary<String,AnyObject> {
                if let values = dict["value"] as? Dictionary<String,AnyObject> {
                    if let jokes = values["joke"] as? String {
                        self.jokeLabel.text = jokes.capitalized
                    }
                }
            }
            
            
        }
    }
}
