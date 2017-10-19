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
    
    @IBOutlet weak var changeJokes: UISwitch!
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGoodJokes()
    }
    
    
    @IBAction func infoBtn(_ sender: UIButton) {
        let alertMessage = "\nShare chuck norris jokes with your friends, family and even with enemies via Text Messages, Facebook Messenger, WhatsApp, Twitter and may more.\n\nTurn off explicit jokes by sliding button on top right.\n\nClick on arrow button for next joke."
        let alertView = UIAlertController(title: "Chuck Norris Jokes Edition", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alertView.addAction(UIAlertAction(title: "Click here to continue jokes", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
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
        if changeJokes.isOn {
            loadJokes()
        } else {
            loadGoodJokes()
        }
        
        self.view.backgroundColor = getRandomColor()
    }
    
    func loadJokes() {
        Alamofire.request("http://api.icndb.com/jokes/random", method: .get).responseJSON { (response) in
            let results = response.result
            if let dict = results.value as? Dictionary<String,AnyObject> {
                if let values = dict["value"] as? Dictionary<String,AnyObject>{
                    if let jokes = values["joke"] as? String {
                        let jokeText = jokes.replacingOccurrences(of: "&quot;", with: " ", options: .regularExpression)
                        self.jokeLabel.text = jokeText.capitalized
                    }
                    
                }
            } 
        }
    }
    
    func loadGoodJokes() {
        Alamofire.request("http://api.icndb.com/jokes/random?exclude=[explicit]", method: .get).responseJSON { (response) in
            let results2 = response.result
            if let dict = results2.value as? Dictionary<String,AnyObject> {
                if let values = dict["value"] as? Dictionary<String,AnyObject> {
                    if let jokes = values["joke"] as? String {
                        let jokeText = jokes.replacingOccurrences(of: "&quot;", with: " ", options: .regularExpression)
                        self.jokeLabel.text = jokeText.capitalized
                    }
                }
            }
        }
    }
}
