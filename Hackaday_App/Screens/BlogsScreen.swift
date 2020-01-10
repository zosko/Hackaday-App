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
    var blogPage: Int = 1
    
    //MARK: IBOutlets
    @IBOutlet var tblBlog : UITableView!
    
    //MARK: CustomFunctions
    func getPosts(){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        API().getPosts(page: blogPage, success: { (posts) in
            self.blogPage += 1
            for post in posts as! [Any]{
                self.arrBlogs.append(BlogModel().initBlogModel(jsonData: post as! Dictionary))
            }
            OperationQueue.main.addOperation {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.tblBlog.reloadData()
                }
            }
        })
    }
    
    //MARK: TableViewDelegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBlogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : BlogsCell = tableView.dequeueReusableCell(withIdentifier: "BlogsCell", for: indexPath) as! BlogsCell
        
        let blogModel : BlogModel = arrBlogs[indexPath.row]
        
        cell.lblTitle.text = blogModel.title.withoutHtml;
        cell.lblIntro.makeYellowText(fullText: blogModel.intro.withoutHtml, toBeYellow: "…read more\n")
        cell.imgImage.sd_setImage(with: blogModel.image, completed: nil)
        cell.lblDate.makeYellowText(fullText: "By " + (blogModel.author?.name ?? "") + " | " + Date().formattedDate(dateInput: blogModel.date), toBeYellow: blogModel.author?.name ?? "")
        
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = arrBlogs.count - 1
        
        if indexPath.row == lastElement {
            getPosts()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let blogModel : BlogModel = arrBlogs[indexPath.row]
        
        let controller : BlogDetailScreen = (self.storyboard?.instantiateViewController(identifier: "BlogDetailScreen"))!
        controller.modelBlog = blogModel
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: ViewControllerDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPosts()
    }

    
}
