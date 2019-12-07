//
//  TableViewCell.swift
//  testXIB
//
//  Created by Sofìa Gutièrrez on 9/14/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var foto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
