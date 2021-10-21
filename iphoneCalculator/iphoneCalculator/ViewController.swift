//
//  ViewController.swift
//  iphoneCalculator
//
//  Created by 유현진 on 2021/08/18.
//  아이폰에 있는 계산기 만들기

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var numberLabel: UILabel!
    

    @IBAction func clearButton(_ sender: UIButton) {
        
    }
    
    @IBAction func buttonCliked(_ sender: UIButton){
        if numberLabel.text! == "0"{
            numberLabel.text = sender.currentTitle!
        }else{
            numberLabel.text! += sender.currentTitle!
        }
        
    }
}


