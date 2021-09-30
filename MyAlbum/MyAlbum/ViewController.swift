//
//  ViewController.swift
//  MyAlbum
//
//  Created by 유현진 on 2021/09/30.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        refresh()
    }
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBAction func challenge(_ sender: Any) {
        let message = "가격은 ₩\(currentValue) 입니다"
        let alert = UIAlertController(title: "도전입니다.", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in self.refresh()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func refresh(){
        let randomPrice = arc4random_uniform(100000)+1
        currentValue = Int(randomPrice)
        priceLabel.text = "₩ \(currentValue)"
    }
}

