//
//  WordHeaderCell.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import UIKit

class WordHeaderCell: UITableViewCell {
    @IBOutlet weak var wordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
