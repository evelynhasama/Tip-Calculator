//
//  ViewController.swift
//  tip
//
//  Created by Evelyn Hasama on 8/12/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
      
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "defaulttip")
        self.tipControl.selectedSegmentIndex = intValue
        let strValue = defaults.string(forKey: "defaultcolor")
        if strValue == "red"{
            self.view.backgroundColor = UIColor.red
        }
        if strValue == "yellow"{
            self.view.backgroundColor = UIColor.yellow}
        if strValue == "blue"{
            self.view.backgroundColor = UIColor.blue}
       
    }

    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        //get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        //calculate tip and total
        let tipPercentages = [0.15,0.18,0.2]
        let tip = bill *  tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update tip and total labels
        tipLabel.text = String(format: "$%.2f" , tip)
        totalLabel.text = String(format: "$%.2f" , total)
    
    }
    
    @IBAction func Button(_ sender: Any) {
        self.billField.text = "0.00"
        self.tipLabel.text = "0.00"
        self.totalLabel.text = "0.00"
    }
    
}


