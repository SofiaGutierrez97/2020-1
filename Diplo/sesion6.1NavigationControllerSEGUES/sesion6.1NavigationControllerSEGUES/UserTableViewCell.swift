//
//  UserTableViewCell.swift
//  sesion6.1NavigationControllerSEGUES
//
//  Created by Sofìa Gutièrrez on 8/24/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var password: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
