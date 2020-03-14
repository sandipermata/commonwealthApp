//
//  inputDataViewController.swift
//  Commonwealth
//
//  Created by Sandi Permata on 14.03.20.
//  Copyright © 2020 sample. All rights reserved.
//

import UIKit
import Alamofire

class inputDataViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var viewEmployee: UIView!
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var salaryField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var task1: UIButton!
    
    var kindOfData: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func printStartRight(_ n: Int) {
        var i: Int = 1
        var j: Int = 1
        
        for i in 1...n {
            var spaces = 2*(n-i)
            print((String(repeating: " ", count: spaces)), terminator: "")
            for i in 1...i {
                print("# ", terminator: "")
            }
            print("")
        }
    }
    
    func printStartLeft(_ n: Int) {
        var i: Int = 1
        var j: Int = 1
        
        for i in 1...n {
//            var spaces = 2*(n-i)
//            print((String(repeating: "", count: spaces)), terminator: "")
            for i in 1...i {
                print("# ", terminator: "")
            }
            print("")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
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
    
    func showData() {
        kindOfData = true
        inputButton.isHidden = false
        nameField.isHidden = false
        salaryField.isHidden = false
        ageField.isHidden = false
        saveButton.isHidden = false
       
        viewEmployee.layer.cornerRadius = 7
        viewEmployee.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewEmployee.layer.borderWidth = 2
        viewEmployee.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        saveButton.layer.cornerRadius = 7
        setupKeyboard()
       
    }
   
    func hideData() {
        kindOfData = false
        inputButton.isHidden = false
        nameField.isHidden = true
        salaryField.isHidden = true
        ageField.isHidden = true
        saveButton.isHidden = true
       
        viewEmployee.layer.cornerRadius = 7
        viewEmployee.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        viewEmployee.layer.borderWidth = 2
        viewEmployee.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
       
        saveButton.layer.cornerRadius = 7
        setupKeyboard()
    }
    
    @IBAction func task1Tapped(_ sender: Any) {
        printStartRight(5)
//        printStartLeft(5)
    }
    
    @IBAction func inputDataTapped(_ sender: Any) {
        if kindOfData! {
           hideData()
        }
        else {
            showData()
        }
    }
    
    
    @IBAction func saveTapped(_ sender: Any) {
        self.postData()
    }
    
    @IBAction func showAmployeeTapped(_ sender: Any) {
        self.navigationController?.pushViewController(DataTableViewController(), animated: true)
    }
    
    func postData() {
       loadingloadViewController.shared.starLoading()
             DispatchQueue.main.async {
                 let parameters = "name=\(self.nameField.text!)&salary=\(self.salaryField.text!)&age=\(self.ageField.text!)";
                apiManager().post(request:  apiManager().clientURLRequest(path: labelText.urlSaveData, params: parameters)) { (success, object) -> () in
                          DispatchQueue.main.async {
                              if success {
                                 print("status input : \(object)")
                              }
                              else {
                                 
                              }
                          }
                      }
                  }
           loadingloadViewController.shared.stopLoading()
      }
}
