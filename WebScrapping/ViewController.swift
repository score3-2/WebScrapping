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
    let urlName = "https://www.apple.com/itunes/charts/songs/"
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrapeURL()
    }
    
    /* 2 Create a func to scrapp the constant url (string version of the url).
     request property to request and hold the url.
     then we tell the method to print on a string if there is any response
     */
    
    func scrapeURL() {
        Alamofire.request(urlName).responseString { response in
            if response.result.isSuccess {
                if let htmlString = response.result.value {
                    self.parseHTML(html: htmlString)
                }
            }
        }
    }
    
    // 3 Parse the html
    func parseHTML(html: String) {
        
        do {
            let doc = try Kanna.HTML(html: html, encoding: String.Encoding.utf8)
            print(doc)
            print(doc.title)
            print(doc.head)
            print(doc.body)
            for div in doc.css("div") {
                if div["class"] == "section-content"{
                    for ul in div.css("ul") {
                        for li in ul.css("li") {
                            print(li.text)
                        }
                    }
                }
            }
            
        } catch {
            print(error)
        }
    }
    
}

