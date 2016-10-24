//
//  InstaCatTableViewController.swift
//  AC3.2-InstaCats-2
//
//  Created by Louis Tur on 10/10/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class InstaCatTableViewController: UITableViewController {
    internal let InstaCatTableViewCellIdentifier: String = "InstaCatCellIdentifier"
    internal let InstaDogTableViewCellIdentifier: String = "InstaDogCellIdentifier"
    
    internal let instaCatJSONFileName: String = "InstaCats.json"
    internal let instaDogJSONFileName: String = "InstaDogs.json"
    
    internal var instaCats: [InstaCat] = []
    internal var instaDogs: [InstaDog] = []
    
    internal let instaCatEndpoint: String = "https://api.myjson.com/bins/254uw"
    internal let instaDogEndpoint: String = "https://api.myjson.com/bins/58n98"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let instaCatsAll: [InstaCat] = InstaCatFactory.makeInstaCats(fileName: instaCatJSONFileName) {
//            self.instaCats = instaCatsAll
        
            
            
            
            //        self.getInstaCats(from: instaCatEndpoint)
             self.getInstaCats(apiEndpoint: instaCatEndpoint) { (instacats: [InstaCat]?) in
                
                if instaCats != nil {
                    for cat in instaCats! {
                        print(cat.description)
                        
                        DispatchQueue.main.async {
                            self.tableview.reloadData()
                        }
                    }
                    
                   InstaDogFactory.getInstaDogs(apiEndpoint: instaDogEndpoint) { (instaDogs: [InstaDog]?) in
                        if instaDogs != nil {
                            for cat in instaDogs! {
                                print(dog.description)
                                
                                DispatchQueue.main.async {
                                    self.tableview.reloadData()
                                }
                            }
                        }
                    }
                    
                    override func didReceiveMemoryWarning() {
                        super.didReceiveMemoryWarning()
                        // Dispose of any resources that can be recreated.
                    }
                    
                    func getInstaCats(apiEndpoint: String, callback: @escaping ([InstaCat]?) -> Void) {
                        
                        if let validInstaCatEndpoint: URL = URL(string: apiEndpoint) {
                            
                            // 1. URLSession/Configuration
                            let session = URLSession(configuration: URLSessionConfiguration.default)
                            
                            // 2. dataTaskWithURL
                            session.dataTask(with: validInstaCatEndpoint) { (data: Data?, response: URLResponse?, error: Error?) in
                                
                                // 3. check for errors right away
                                if error != nil {
                                    print("Error encountered!: \(error!)")
                                }
                                
                                // 4. printing out the data
                                if let validData: Data = data {
                                    print(validData) // not of much use other than to tell us that data does exist
                                    
                                    if let allTheCats: [InstaCat] = InstaCatFactory.manager.getInstaCats(from: validData) {
                                        print(allTheCats)
                                        callback(allTheCats)
                                    }
                                }
                            }.resume()
                        }
                    }
                    
                    
                    //    func getInstaCats(from apiEndpoint: String) { // <<< returns Void
                    //        if let validInstaCatEndpoint: URL = URL(string: apiEndpoint) {
                    //
                    //            // 1. Start with URLSession/Configuration
                    //            let session = URLSession(configuration: URLSessionConfiguration.default)
                    //
                    //            // 2. dataTaskWithURL to initiate request
                    //            session.dataTask(with: validInstaCatEndpoint) { (data: Data?, response: URLResponse?, error: Error?) in
                    //
                    //                // 3. check for errors right away
                    //                if error != nil {
                    //                    print("Error encountered!: \(error!)")
                    //                }
                    //
                    //                // 4. printing out the data
                    //                if let validData: Data = data {
                    //                    print(validData)
                    //
                    //                    // 5. reuse our code to make some cats from Data
                    //
                    //                    // update the UI by wrapping the UI-updating code inside of a DispatchQueue closure
                    //                    DispatchQueue.main.async {
                    //                        self.tableView.reloadData()
                    //                    }
                    //
                    //                    // 6. if we're able to get non-nil [InstaCat], set our variable and reload the data
                    //                    if let allTheCats: [InstaCat] = InstaCatFactory.manager.getInstaCats(from: validData) {
                    //                        self.instaCats = allTheCats
                    //                        self.tableView.reloadData()
                    //                    }
                    //                }
                    //            }.resume() // Other: Easily forgotten, but we need to call resume to actually launch the task
                    //        }
                    //    }
                    //
                    
                    
                    // MARK: - Table view data source
                    override func numberOfSections(in tableView: UITableView) -> Int {
                        return 2
                    }
                    
                    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                        return self.instaCats.count
                    }
                    
                    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                        let cell = tableView.dequeueReusableCell(withIdentifier: InstaCatTableViewCellIdentifier, for: indexPath)
                        
                        //To print separate sections
                        
                        switch indexPath.section {
                            
                        case 0: //cats
                            cell.textLabel?.text = self.instaCats[indexPath.row].name
                            cell.detailTextLabel?.text = self.instaCats[indexPath.row].description
                            
                        case 1: //dogs
                            cell.textLabel?.text = self.instaDogs[indexPath.row].name
                            cell.detailTextLabel?.text = self.instaDogs[indexPath.row].description
                        }
                        
                        return cell
                    }
                    
            }
                
        }
            
    }
        
}


