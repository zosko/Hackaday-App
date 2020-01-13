//
//  BlogDetail.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/9/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

class BlogDetailScreen: UIViewController {

    @IBOutlet var lblTitle : UILabel!
    @IBOutlet var lblContent : UILabel!
    @IBOutlet var lblAuthor : UILabel!
    @IBOutlet var lblDate : UILabel!
    @IBOutlet var scrollImages : UIScrollView!

    @IBOutlet var headerTable : UIView!
    
    var modelBlog : BlogModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = modelBlog.title
        lblContent.text = modelBlog.content.withoutHtml
        lblContent.numberOfLines = lblContent.calculateMaxLines() + 5
        lblAuthor.makeYellowText(fullText: "By: " + (modelBlog.author?.name ?? ""), toBeYellow: modelBlog.author?.name ?? "")
        lblDate.text = Date().formattedDate(dateInput: modelBlog.date)
        
        let height = lblContent.systemLayoutSizeFitting(CGSize(width: scrollImages!.frame.width, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
        self.headerTable.frame = CGRect(x: 0 , y: 0, width: scrollImages!.frame.width, height: height + 450)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async {
            
            for modelMedia in self.modelBlog.media{
                let index = self.modelBlog.media.firstIndex(where: {$0 == modelMedia})!
                let xPos = CGFloat(index) * self.scrollImages!.frame.width
                
                let imgMedia : UIImageView = UIImageView()
                imgMedia.frame = CGRect(x: xPos , y: 0, width: self.scrollImages!.frame.width, height: self.scrollImages!.frame.height)
                imgMedia.sd_setImage(with: modelMedia.link, completed: nil)
                imgMedia.contentMode = .scaleToFill
                self.scrollImages?.addSubview(imgMedia)
            }
            
            self.scrollImages.contentSize = CGSize(width: CGFloat(self.modelBlog.media.count) * self.scrollImages!.frame.width, height: 0)
        }
    }
}
