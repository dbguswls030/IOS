//
//  ViewController.swift
//  iphoneCalculator
//
//  Created by 유현진 on 2021/08/18.
//  아이폰에 있는 계산기 만들기

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    // Struct with our data and functions for
    // working with that data
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearClicked(_ sender: UIButton) {
        numberLabel.text = calculator.clearButtonClicked()
    }
    @IBAction func numberClicked(_ sender: UIButton) {
        
        //print(type(of: String(sender.titleLabel!.text!)))
        //print(sender.currentTitle!)
        numberLabel.text = calculator.numberButtonClicked(String(sender.titleLabel!.text!))
        
    }
    @IBAction func signClicked(_ sender: UIButton) {
        numberLabel.text = calculator.signButtonClicked(numberLabel.text ?? "0")
    }
    @IBAction func percentClicked(_ sender: UIButton) {
        numberLabel.text = calculator.percentButtonClicked(numberLabel.text ?? "0")
    }
    @IBAction func mathButtonClicked(_ sender: UIButton) {
        calculator.mathButtonClicked(String(sender.titleLabel!.text!))
        //print(sender.currentTitle!)
    }
    @IBAction func equalClicked(_ sender: UIButton) {
        numberLabel.text = calculator.equalButtonClicked()
    }

}


