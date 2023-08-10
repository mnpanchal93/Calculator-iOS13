//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
        
    private var isFinshedTypingNumber : Bool = true
        
    private var calculator = CalculatorLogic()
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display value to double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinshedTypingNumber = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calcualte(symbol: calcMethod) {
                displayValue = result
            }
            
        }
        

        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
 
        if let num =  sender.currentTitle {
            if isFinshedTypingNumber {
                displayLabel.text = num
                isFinshedTypingNumber = false
            } else {
                
                if num == "." {
                    guard let currrentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot covert the display label in Double")
                    }
                    let isInt  = floor(currrentDisplayValue) == currrentDisplayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + num
            }
        }
    
    }

}

