//
//  ViewController.swift
//  signUpPage
//
//  Created by 유현진 on 2021/03/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var pwField: UITextField!
     
    func userInfoInit(){
        UserInformation.shared.id = nil
        UserInformation.shared.date = nil
        UserInformation.shared.password = nil
        UserInformation.shared.phoneNumber = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        userInfoInit()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.idField.text = UserInformation.shared.id
        
    }
    
    
    
}
