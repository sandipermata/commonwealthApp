//
//  DataTableViewController.swift
//  Commonwealth
//
//  Created by Sandi Permata on 14.03.20.
//  Copyright © 2020 sample. All rights reserved.
//

import UIKit

struct employee {
    var id: String?
    var name: String?
    var salary: String?
    var age: String?
    
    init(id: String, name: String, salary: String, age: String) {
        self.id = id
        self.name = name
        self.salary = salary
        self.age = age
    }
}

class DataTableViewController: UITableViewController {
        
    var dataEmploye = [employee]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(dataTableViewCell.self, forCellReuseIdentifier: "dataTableViewCell")
        self.tableView.register(UINib(nibName: "dataTableViewCell", bundle: nil), forCellReuseIdentifier: "dataTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.fetchAllEmployee()
        dataEmploye.removeAll()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Employee List"
        navigationController?.isNavigationBarHidden = false
    }
   
    func fetchAllEmployee() {
        dataEmploye.removeAll()
        loadingloadViewController.shared.starLoading()
              DispatchQueue.main.async {
      //                 let parameters = "username=\(self.username.text!)&password=\(self.password.text!)";
                  let parameters = ""
                       print("data input = \(parameters)")
                  apiManager().get(request:  apiManager().clientURLRequest(path: labelText.urlGetAllEmployee, params: parameters)) { (success, object) -> () in
                           DispatchQueue.main.async {
                               if success {
                                   let passedMessage = object!["status"] as? String
                                   if (passedMessage == "success") {
                                       let parsing = object!["data"] as? [Dictionary<String, AnyObject>]
                                      
                                      print("data parsing : \(parsing)")
                                         
                                       for resultFinal in parsing! {
                                           let id = resultFinal["id"] as? String
                                           let employee_name = resultFinal["employee_name"] as? String
                                           let employee_salary = resultFinal["employee_salary"] as? String
                                           let employee_age = resultFinal["employee_age"] as? String
                                          
                                        print("data id : \(id)")
                                        self.dataEmploye.append(employee(id: id!, name: employee_name!, salary: employee_salary!, age: employee_age!))
                                       }
                                   }
                               } else {
                                  
                               }
                                self.tableView.reloadData()
                           }
                       }
                   }
            loadingloadViewController.shared.stopLoading()
   }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataEmploye.count
    }
    
    @objc func selectData(sender: UIButton) {
        print("data 1")
        let index = IndexPath(row: sender.tag, section: 0)
        let cell: dataTableViewCell = self.tableView.cellForRow(at: index) as! dataTableViewCell
        
        let vc = editDataViewController()
        vc.nameF = cell.nameLabel.text!
        vc.salaryF = cell.salaryLabel.text!
        vc.ageF = cell.ageLabel.text!
        navigationController?.pushViewController(vc, animated: true)
    }
    
     @objc func deleteData() {
        print("data 2")
     }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
       let cell = tableView.dequeueReusableCell(withIdentifier: "dataTableViewCell", for: indexPath as IndexPath) as! dataTableViewCell
       
        cell.nameLabel.text = dataEmploye[indexPath.row].name
        cell.ageLabel.text = dataEmploye[indexPath.row].age
        cell.salaryLabel.text = dataEmploye[indexPath.row].salary
        cell.idLabel.text = dataEmploye[indexPath.row].id
        cell.editButton.tag = indexPath.row
        cell.editButton.addTarget(self, action: #selector(selectData(sender:)), for: .touchUpInside)
        cell.deleteButton.addTarget(self, action: #selector(deleteData), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
          
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 200
    }

    
}
