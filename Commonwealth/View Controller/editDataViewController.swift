//
//  editDataViewController.swift
//  Commonwealth
//
//  Created by Sandi Permata on 14.03.20.
//  Copyright © 2020 sample. All rights reserved.
//

import UIKit

class editDataViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var viewEmployee: UIView!
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var salaryField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var nameF = String()
    var salaryF = String()
    var ageF = String()
    var idF = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        nameField.text = nameF
        salaryField.text = salaryF
        ageField.text = ageF
        
        showData()
    }
    
    func showData() {
        inputButton.isHidden = true
        nameField.isHidden = false
        salaryField.isHidden = false
        ageField.isHidden = false
        saveButton.isHidden = false
        viewEmployee.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        saveButton.layer.cornerRadius = 7
        setupKeyboard()
    }
    
    func setupKeyboard() {
       self.nameField.delegate = self
       self.salaryField.delegate = self
       self.ageField.delegate = self
       self.nameField.returnKeyType = UIReturnKeyType.done
       self.nameField.keyboardType = UIKeyboardType.default
       self.salaryField.returnKeyType = UIReturnKeyType.done
       self.salaryField.keyboardType = UIKeyboardType.default
       self.ageField.returnKeyType = UIReturnKeyType.done
       self.ageField.keyboardType = UIKeyboardType.default
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        loadingloadViewController.shared.starLoading()
            DispatchQueue.main.async {
                let parameters = "name=\(self.nameField.text!)&salary=\(self.salaryField.text!)&age=\(self.ageField.text!)";
                apiManager().put(request:  apiManager().clientURLRequest(path: labelText.urlUpdateEmployee+"/"+self.idF, params: parameters)) { (success, object) -> () in
                         DispatchQueue.main.async {
                             if success {
                                   print("status update : \(object)")
                             }
                             else {
                                
                             }
                         }
                     }
                 }
          loadingloadViewController.shared.stopLoading()
    }
    


}
