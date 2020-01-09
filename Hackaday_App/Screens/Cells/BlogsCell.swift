//
//  BlogsCell.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/9/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

class BlogsCell: UITableViewCell {

    @IBOutlet var lblDate : UILabel!
    @IBOutlet var lblTitle : UILabel!
    @IBOutlet var lblIntro : UILabel!
    @IBOutlet var imgImage : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
