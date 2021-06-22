//
//  SignUpViewController.swift
//  signUpPage
//
//  Created by 유현진 on 2021/04/16.
//

import UIKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate{

    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var checkPassword: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var confirmButton: UIButton!

    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage: UIImage = info [UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = originalImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
  
    
    //이미지뷰, 아이디, 패스워드, 패스워드확인, 텍스트뷰
    @IBAction func textFieldDidChangeSelection(_ textField: UITextField) {
        if password.text!.count > 0 && checkPassword.text == password.text && imageView.image != nil && id.hasText && textView.hasText{
            confirmButton.isEnabled = true
        }else{
            confirmButton.isEnabled = false
        }
    }
    
    @IBAction func textViewDidChange(_ textView: UITextView) {
        if password.text!.count > 0 && checkPassword.text == password.text && imageView.image != nil && id.hasText && self.textView.hasText{
            confirmButton.isEnabled = true
        }else{
            confirmButton.isEnabled = false
        }
    }
    
    @IBAction func backPage(){
        userInfoInit()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextPage(){
        UserInformation.shared.id = id.text
        
    }
    func userInfoInit(){
        UserInformation.shared.id = nil
        UserInformation.shared.date = nil
        UserInformation.shared.password = nil
        UserInformation.shared.phoneNumber = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        confirmButton.isEnabled = false
        self.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
   
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.id.text = UserInformation.shared.id
        
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
