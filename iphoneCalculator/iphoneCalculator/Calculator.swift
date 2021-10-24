//
//  Calculator.swift
//  iphoneCalculator
//
//  Created by 유현진 on 2021/10/23.
//

import Foundation

struct Calculator{
    var preVal: String = ""
    var tempVal: String = ""
    var resultVal: String = ""
    var mathOperator: String = ""
    var decimalCliked: Bool = false
    
    mutating func numberButtonClicked(_ input: String) -> String{
        if !resultVal.isEmpty{
            self.tempVal = input
            self.resultVal = ""
        }else{
            if input == "."{
                if self.decimalCliked != true{
                    self.tempVal += input
                    self.decimalCliked = true
                }
            }else{
                self.tempVal += input
            }
        }
        return self.tempVal
    }
    
    mutating func mathButtonClicked(_ input: String){
        if !resultVal.isEmpty{
            self.preVal = self.tempVal
        }else{
            self.preVal = self.resultVal
        }
        
        
        self.tempVal = ""
        self.mathOperator = input
        self.decimalCliked = false
        self.resultVal = ""
    }
    
    mutating func equalButtonClicked() -> String{
        self.decimalCliked = false
        let preValDbl = Double(self.preVal)!
        let tempValDbl = Double(self.tempVal)!
        switch(self.mathOperator){
        case "+":
            self.resultVal = String(format: "%f", (preValDbl + tempValDbl))
        case "-":
            self.resultVal = String(format: "%f", (preValDbl - tempValDbl))
        case "÷":
            self.resultVal = String(format: "%f", (preValDbl / tempValDbl))
        case "×":
            self.resultVal = String(format: "%f", (preValDbl * tempValDbl))
        default:
            self.resultVal = self.tempVal
        }
        
        self.preVal = self.resultVal
        return self.resultVal
    }
    
    mutating func clearButtonClicked() -> String{
        self.tempVal = ""
        self.mathOperator = ""
        self.preVal = ""
        self.decimalCliked = false
        self.resultVal = ""
        
        return "0"
    }
    
    mutating func percentButtonClicked(_ input: String) -> String{
        
        return ""
    }
    
    mutating func signButtonClicked(_ input: String) -> String{
        let reversedVal = Double(input)!
        
        if  reversedVal > 0 || reversedVal < 0{
            self.tempVal = String(reversedVal * -1)
            return self.tempVal
        }else{
            return "0"
        }
        
    }
}
