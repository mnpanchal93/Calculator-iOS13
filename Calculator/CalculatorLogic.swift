//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by mansi panchal on 17/07/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
 
    var number: Double
    
    func calcualte(symbol: String) -> Double? {
        
        switch(symbol){
        case "AC":
            return 0
        case "+/-":
            return number * -1
        case "%":
            return number / 100
        default:
            return nil
        }
    }
    
    
}
