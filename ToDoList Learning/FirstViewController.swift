//
//  FirstViewController.swift
//  ToDoList Learning
//
//  Created by admin on 6/5/17.
//  Copyright © 2017 KahoTestSwitft. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var items = [String]()
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        /*
        var cellLabel = ""
        
        if let tempLabel = items[indexPath.row] as? String{
            cellLabel = tempLabel
        }
        */  // No need to check because it sure that the data would be string
        
        cell.textLabel?.text = items[indexPath.row]
//        print(cellLabel)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            items.remove(at: indexPath.row)
        
        tableView.reloadData()
        
        UserDefaults.standard.set(items, forKey: "items")
        }
        
    }
    
   
    

    override func viewDidAppear(_ animated: Bool) {
    //Load everytime View appears
        let itemObjects = UserDefaults.standard.object(forKey: "items")
        if let tempsArray = itemObjects as? [String] {
            print ("Hello")
            items = tempsArray // Put data into Arrays. so It could be used to count number of items in Array.
        }
        
        print(items)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Only load once
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

