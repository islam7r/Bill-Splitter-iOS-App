//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Islam Rzayev on 27.10.24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tip = String()
    var split = String()
    var total = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        totalLabel.text = total
        settingsLabel.text = "Split between \(split) people, with \(tip) tip."
    }
    
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
