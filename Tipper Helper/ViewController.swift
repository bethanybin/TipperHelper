//
//  ViewController.swift
//  Tipper Helper
//
//  Created by Bethany Bin on 12/26/17.
//  Copyright © 2017 Bethany Bin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var moneyLabel1: UILabel!
    @IBOutlet weak var moneyLabel2: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    var tipPercentages = [0.18, 0.2, 0.25]
    var total = 0.0
    var splitValue = 0.0
    @IBAction func personStepper(_ sender: UIStepper) {
        personLabel.text = Int(sender.value).description
        let intPerson = Int(sender.value)
        splitValue = total/Double(intPerson)
        splitLabel.text = String(splitValue)
        
    }
    let defaults = UserDefaults.standard
    let currency = NumberFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self,selector: #selector(applicationDidEnterBackground),name: NSNotification.Name.UIApplicationDidEnterBackground,object: nil)
        NotificationCenter.default.addObserver(self,selector: #selector(applicationWillEnterForeground),name: NSNotification.Name.UIApplicationWillEnterForeground,object: nil)
        moneyLabel1.text = currency.currencySymbol
        moneyLabel2.text = currency.currencySymbol
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @objc func applicationDidEnterBackground() {
        print("enter background")
        UserDefaults.standard.set(Date(), forKey:"beginTime")
    }
    @objc func applicationWillEnterForeground(){
        print("enter foreground")
        if let date = UserDefaults.standard.object(forKey: "beginTime") as? Date {
            if let diff = Calendar.current.dateComponents([.minute], from: date, to: Date()).minute, diff > 10 {
                billField.text = ""
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "percentage")
        billField.becomeFirstResponder()
        updateTip(tipAmount: tipControl.selectedSegmentIndex)
        moneyLabel1.text = currency.currencySymbol
        moneyLabel2.text = currency.currencySymbol
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UserDefaults.standard.set(Date(), forKey:"beginTime")
    }
    
    func applicationWillEnterBackground(_application: UIApplication){
        UserDefaults.standard.set(Date(), forKey:"beginTime")
        debugPrint("enter background")

    }
    
    func applicationDidBecomeActive(_application: UIApplication){
        if let date = UserDefaults.standard.object(forKey: "beginTime") as? Date {
            if let diff = Calendar.current.dateComponents([.minute], from: date, to: Date()).minute, diff > 1 {
                billField.text = ""
            }
        }
        debugPrint("enter active")
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        adjustTips()
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    func updateTip(tipAmount: Int){
        adjustTips()
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipAmount]
        total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    func adjustTips(){
        if(defaults.string(forKey: "firstDefault") != ""){
            tipPercentages[0] = (defaults.double(forKey: "firstDefault"))/100
            tipControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"firstDefault")), forSegmentAt: 0)
        }
        if(defaults.string(forKey: "secondDefault") != ""){
            tipPercentages[1] = (defaults.double(forKey: "secondDefault"))/100
            tipControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"secondDefault")), forSegmentAt: 1)
        }
        if(defaults.string(forKey: "thirdDefault") != ""){
            tipPercentages[2] = (defaults.double(forKey: "thirdDefault"))/100
            tipControl.setTitle(String(format: "%.0f%%", defaults.double(forKey:"thirdDefault")), forSegmentAt: 2)
        }
    }
    
}

