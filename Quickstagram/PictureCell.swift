//
//  PictureCell.swift
//  Quickstagram
//
//  Created by Oscar Reyes on 3/11/17.
//  Copyright © 2017 Oscar Reyes. All rights reserved.
//

import UIKit
import Parse

class PictureCell: UITableViewCell {

    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var instagramPost: PFObject!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
