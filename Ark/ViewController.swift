//
//  ViewController.swift
//  Ark
//
//  Created by Benjamin Odisho on 10/28/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

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

