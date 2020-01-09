//
//  Blogs.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/9/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit
import MBProgressHUD
import SDWebImage

class BlogsScreen: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    //MARK: Variables
    var arrBlogs: [BlogModel] = []
    
    //MARK: IBOutlets
    @IBOutlet var tblBlog : UITableView!
    
    //MARK: TableViewDelegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBlogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : BlogsCell = tableView.dequeueReusableCell(withIdentifier: "BlogsCell", for: indexPath) as! BlogsCell
        
        let blogModel : BlogModel = arrBlogs[indexPath.row]
        
        cell.lblTitle.text = blogModel.title.withoutHtml;
        cell.lblIntro.text = blogModel.intro.withoutHtml;
        cell.imgImage.sd_setImage(with: blogModel.image, completed: nil)
        cell.lblDate.text = Date().formattedDate(dateInput: blogModel.date)
        
        return cell
    }
    
    //MARK: ViewControllerDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        API().getPosts { (posts) in
            
            for post in posts as! [Any]{
                self.arrBlogs.append(BlogModel().initBlogModel(jsonData: post as! Dictionary))
            }
            OperationQueue.main.addOperation {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.tblBlog.reloadData()
            }
            
            
        }
    }

    
}
