//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by mansi panchal on 17/07/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
 
    private var number: Double?
    
    private var intermediateCalucaltion: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ num : Double) {
        number = num
    }
    
    mutating func calcualte(symbol: String) -> Double? {
        if let n = number {
            switch(symbol){
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "=":
                return perfromTwoNumberCalculation(n2:n)
            default:
                intermediateCalucaltion = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func perfromTwoNumberCalculation(n2: Double) -> Double? {
        if let symbol = intermediateCalucaltion?.calcMethod, let n1 = intermediateCalucaltion?.n1 {
            switch(symbol){
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "*":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed didn't match any options")
            }
        }
        return nil
    }
    
    
}
