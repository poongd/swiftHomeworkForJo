//
//  NoteListCell.swift
//  poongdHomework_dataSave
//
//  Created by jsp on 2016. 6. 6..
//  Copyright © 2016년 jsp. All rights reserved.
//

import UIKit

class NoteListCell: UITableViewCell {
    

    @IBOutlet var cell_text: UILabel!
    @IBOutlet var cell_date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
