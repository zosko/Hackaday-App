//
//  API.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/9/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

public typealias SuccessAPI = ((Any) -> ())

class API: NSObject {
    //  POSTS DETAILS   /wp/v2/posts/[ID]
    
    //  PAGES   /wp/v2/pages
    
    func get(url:String, success: @escaping SuccessAPI){
        let url = URL(string: "https://hackaday.com/wp-json" + url)!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            do{
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                success(jsonData)
            }
            catch{
                print("Error json serialization")
            }
        }
        task.resume()
    }
    
    func getPosts(page: Int, success: @escaping SuccessAPI){
        get(url: "/wp/v2/posts?page=\(page)") { (jsonData) in
            success(jsonData)
        }
    }
    func getAuthor(author: Int, success: @escaping SuccessAPI){
        get(url: "/wp/v2/users/\(author)") { (jsonData) in
            success(jsonData)
        }
    }
    
    func getAllMedia(postID: Int, success: @escaping SuccessAPI){
        get(url: "/wp/v2/media?parent=\(postID)") { (jsonData) in
            success(jsonData)
        }
    }
}
