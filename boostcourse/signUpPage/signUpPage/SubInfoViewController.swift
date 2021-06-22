//
//  SubInfoViewController.swift
//  signUpPage
//
//  Created by 유현진 on 2021/04/17.
//

import UIKit

class SubInfoViewController: UIViewController  {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var phoneNumber: UITextField!
    
    
    func dateInit() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: Date())
    }
    
    @objc func updateDateLabel(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func cancelButton(){
        UserInformation.shared.id = nil
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func goBackPage(){
        UserInformation.shared.phoneNumber = phoneNumber.text
        UserInformation.shared.date = datePicker.date
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUp(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        datePicker.addTarget(self, action: #selector(updateDateLabel), for: .valueChanged)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let date = UserInformation.shared.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy"
            dateLabel.text = dateFormatter.string(from: date)
        }else{
            dateLabel.text = dateInit()
        }
        phoneNumber.text = UserInformation.shared.phoneNumber
        datePicker.date = UserInformation.shared.date ?? Date()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
