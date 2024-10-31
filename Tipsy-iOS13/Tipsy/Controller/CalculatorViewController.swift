//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var stepperValue: UIStepper!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var previousSelectedButton: UIButton!
    
    var result: Float = 0.0
    var bill = Float()
    var tip = String()
    var splitNumWithoutDecimalPoint = String()
    
    var splitNum = Float()
    override func viewDidLoad() {
        
    }
    @IBAction func tipChanged(_ sender: UIButton) {

         billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        var billInput = Float(billTextField.text!)
        
        if let billInputNum = billInput{
            bill = (billInputNum * ((100.0 + Float(sender.currentTitle!.dropLast())!) / 100.0 ))
            
        }else{
            bill = 0.0
        }
        
        
        tip = sender.currentTitle!
        
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //        stepperValue.stepValue = 1
        stepperValue.minimumValue = 2      // Minimum value
        stepperValue.maximumValue = 25     // Maximum value
        stepperValue.stepValue = 1         // Increment or decrement step
        
        
        splitNumberLabel.text = String(Int(stepperValue.value))
        splitNum = Float(splitNumberLabel.text!)!
        splitNumWithoutDecimalPoint = String(format: "%.0f", splitNum)
        
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        print(bill / splitNum)
        performSegue(withIdentifier: "toResultVC", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = String(bill / splitNum)
            destinationVC.split = splitNumWithoutDecimalPoint
            destinationVC.tip = tip
        }
    }
    
}

