//
//  dataTableViewCell.swift
//  Commonwealth
//
//  Created by Sandi Permata on 14.03.20.
//  Copyright © 2020 sample. All rights reserved.
//

import UIKit

class dataTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        editButton.layer.cornerRadius = 7
        deleteButton.layer.cornerRadius = 7
    }

    
}
