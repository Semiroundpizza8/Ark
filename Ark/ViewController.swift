//
//  ViewController.swift
//  Ark
//
//  Created by Benjamin Odisho on 10/28/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//

import UIKit
import SwiftyJSON
//AIzaSyAr4zrcqURiT5rvkUzlmmSCv4htSDICQcY
import GoogleMaps

class ViewController: UIViewController {

//    GMSServices.provideAPIKey("AIzaSyAr4zrcqURiT5rvkUzlmmSCv4htSDICQcY")
//    GMSPlacesClient.provideAPIKey("AIzaSyAr4zrcqURiT5rvkUzlmmSCv4htSDICQcY")
    
    class Victim {
        var name: String = ""
        var lat: Double = 0.0
        var lon: Double = 0.0
        var timestamp: Int = 0
        var id: Int = 0
        var rescued: Bool = false
        
        init(name: String,
             lat: Double,
             lon: Double,
             timestamp: Int,
             id: Int,
             rescued: Bool) {
            self.name = name
            self.lat = lat
            self.lon = lon
            self.timestamp = timestamp
            self.id = id
            self.rescued = rescued
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func downloadPredictions(){
        //CHECK FOR INTERNET CONNECTION
            
        let searchURL = "http://api.fixer.io/latest?symbols=USD,GBP"
            guard let requestUrl = URL(string:searchURL)
                else{return}
            
        let currentVictims = Victim(name: "Bob", lat: 2.222, lon: 2.222, timestamp: 34, id: 34, rescued: true)
        print(currentVictims.name)
        
        let jsonData = NSData(contentsOf: requestUrl)
            
        let readableJSON = try! JSONSerialization.jsonObject(with: jsonData! as Data, options: []) as![String:AnyObject]
    
        let object = JSON(readableJSON)
        print(jsonData)
        
    }
    
    @IBAction func sendSavedButtonPress(_ sender: AnyObject) {
        print("In Button");
        downloadPredictions();
    }

}

