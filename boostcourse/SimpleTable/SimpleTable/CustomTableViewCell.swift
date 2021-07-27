//
//  CustomTableViewCell.swift
//  SimpleTable
//
//  Created by 유현진 on 2021/07/27.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
