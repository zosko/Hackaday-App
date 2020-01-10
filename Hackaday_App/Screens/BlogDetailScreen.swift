//
//  BlogDetail.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/9/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

class BlogDetailScreen: UIViewController {

    @IBOutlet var lblContent : UITextView!
    
    var modelBlog : BlogModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblContent.attributedText = modelBlog.content.htmlToAttributedString
        self.title = modelBlog.title
    }
}
