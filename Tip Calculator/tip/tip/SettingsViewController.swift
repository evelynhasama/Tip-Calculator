//
//  SettingsViewController.swift
//  tip
//
//  Created by Evelyn Hasama on 8/12/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    
   
    @IBOutlet weak var defaultControl: UISegmentedControl!
    
    
    @IBOutlet weak var colorControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func DefaultTip(_ sender: Any) {
    
        let defaults = UserDefaults.standard
        defaults.set(defaultControl.selectedSegmentIndex, forKey: "defaulttip")
        
        defaults.synchronize()
    
    
    }

    @IBAction func DefaultColor(_ sender: Any) {
        let colorSelected = ["red","yellow","blue"]
        let DefaultColor = colorSelected[colorControl.selectedSegmentIndex]
        if DefaultColor == "red"{
            self.view.backgroundColor = UIColor.red}
            if DefaultColor == "yellow"{
                self.view.backgroundColor = UIColor.yellow}
            if DefaultColor == "blue"{
                self.view.backgroundColor = UIColor.blue}
        let defaults = UserDefaults.standard
        defaults.set(DefaultColor, forKey: "defaultcolor")
        defaults.synchronize()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "defaulttip")
        self.defaultControl.selectedSegmentIndex = intValue
        
        let strValue = defaults.string(forKey: "defaultcolor")
        var indexColor = 0
        if strValue == "red"{
            indexColor = 0
            self.view.backgroundColor = UIColor.red
        }
        if strValue == "yellow"{
            indexColor = 1
            self.view.backgroundColor = UIColor.yellow}
        if strValue == "blue"{
            indexColor = 2
            self.view.backgroundColor = UIColor.blue}
        self.colorControl.selectedSegmentIndex = indexColor
        
        
        }
    
}
