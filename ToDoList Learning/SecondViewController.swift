//
//  SecondViewController.swift
//  ToDoList Learning
//
//  Created by admin on 6/5/17.
//  Copyright © 2017 KahoTestSwitft. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        
        let itemObject = UserDefaults.standard.object(forKey: "items")
        
        var items:[String] // Create array of strings
        
        //Check if there data ?
        if let tempItems = itemObject as? [String] { // If yea, add item to the array
            items = tempItems 
            items.append(textField.text!)
        } else {
            items = [textField.text!] // else add into the array as first data
        }
        UserDefaults.standard.set(items,forKey:"items")
        textField.text = ""
        print(items)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

