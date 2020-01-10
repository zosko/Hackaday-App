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
    @IBOutlet var lblAuthor : UILabel!
    @IBOutlet var lblDate : UILabel!
    @IBOutlet var scrollImages : UIScrollView!
    
    var modelBlog : BlogModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblContent.text = modelBlog.content.withoutHtml
        lblAuthor.makeYellowText(fullText: "By " + (modelBlog.author?.name ?? ""), toBeYellow: modelBlog.author?.name ?? "")
        lblDate.text = Date().formattedDate(dateInput: modelBlog.date)
        
        for modelMedia in modelBlog.media{
            let index = modelBlog.media.firstIndex(where: {$0 == modelMedia})!
            
            let xPos = CGFloat(index) * scrollImages!.frame.width
            
            let imgMedia : UIImageView = UIImageView()
            imgMedia.frame = CGRect(x: xPos , y: 0, width: scrollImages!.frame.width, height: scrollImages!.frame.width)
            imgMedia.sd_setImage(with: URL(string: modelMedia.link), completed: nil)
            scrollImages?.addSubview(imgMedia)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollImages.contentSize = CGSize(width: CGFloat(modelBlog.media.count) * scrollImages!.frame.width, height: scrollImages!.frame.height)
        
        print("width : \(scrollImages.contentSize.width)")
    }
}
