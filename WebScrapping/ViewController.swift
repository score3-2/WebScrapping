//
//  ViewController.swift
//  WebScrapping
//
//  Created by Abel C on 12/24/18.
//  Copyright © 2018 Abel Caramazana. All rights reserved.
//

import UIKit
import Alamofire
import Kanna

class ViewController: UIViewController {
    
    // 1 Create a constant to hold the web url
    let urlName = "https://colorhunt.co/palette/117534"
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrapeURL()
    }

    /* 1 Create a func to scrapp the constant url (string version of the url).
     request property to request and hold the url.
     then we tell the method to print on a string if there is any response
     */
 
    func scrapeURL() {
        Alamofire.request(urlName).responseString { response in
            print(response.result.isSuccess)
            print(response.result.value)
        }
    }

}

