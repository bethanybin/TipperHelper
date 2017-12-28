//
//  SettingsViewController.swift
//  Tipper Helper
//
//  Created by Bethany Bin on 12/26/17.
//  Copyright © 2017 Bethany Bin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSettingsControl: UISegmentedControl!
    
    @IBOutlet weak var firstCustomField: UITextField!
    @IBOutlet weak var secondCustomField: UITextField!
    @IBOutlet weak var thirdCustomField: UITextField!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func resetButton(_ sender: Any) {
        defaults.set(tipSettingsControl.selectedSegmentIndex, forKey: "percentage")
        defaults.set(18, forKey:"firstDefault")
        defaults.set(20, forKey:"secondDefault")
        defaults.set(25, forKey:"thirdDefault")
        tipSettingsControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"firstDefault")), forSegmentAt: 0)
        tipSettingsControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"secondDefault")), forSegmentAt: 1)
        tipSettingsControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"thirdDefault")), forSegmentAt: 2)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func percentageChanged(_ sender: Any) {
        defaults.set(tipSettingsControl.selectedSegmentIndex, forKey: "percentage")
        defaults.synchronize()
    }
    
    @IBAction func firstCustomChanged(_ sender: Any) {
        defaults.set(firstCustomField.text, forKey:"firstDefault")
        tipSettingsControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"firstDefault")), forSegmentAt: 0)
        defaults.synchronize()
    }
    
    @IBAction func secondCustomChanged(_ sender: Any) {
        defaults.set(secondCustomField.text, forKey:"secondDefault")
        tipSettingsControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"secondDefault")), forSegmentAt: 1)
        defaults.synchronize()
    }
    
    @IBAction func thirdCustomChanged(_ sender: Any) {
        defaults.set(thirdCustomField.text, forKey:"thirdDefault")
        tipSettingsControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"thirdDefault")), forSegmentAt: 2)
        defaults.synchronize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        defaults.set(tipSettingsControl.selectedSegmentIndex, forKey: "percentage")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipSettingsControl.selectedSegmentIndex = defaults.integer(forKey: "percentage")
        if(defaults.string(forKey: "firstDefault") != ""){
            tipSettingsControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"firstDefault")), forSegmentAt: 0)
        }
        if(defaults.string(forKey: "secondDefault") != ""){
            tipSettingsControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"secondDefault")), forSegmentAt: 1)
        }
        if(defaults.string(forKey: "thirdDefault") != ""){
            tipSettingsControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"thirdDefault")), forSegmentAt: 2)
        }
        defaults.synchronize()
    }
    
    
    
    
}
