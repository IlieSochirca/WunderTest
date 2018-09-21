//
//  CarUITableViewCell.swift
//  wunder
//
//  Created by Ilie Sochirca on 19/09/2018.
//  Copyright © 2018 Ilie Sochirca. All rights reserved.
//

import UIKit

class CarUITableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
