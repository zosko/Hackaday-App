//
//  Blog.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/9/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

class BlogModel: NSObject {
    
    var id : Int = 0
    var date : Date = Date.init()
    var link : String = ""
    var title : String = ""
    var content : String = ""
    var intro : String = ""
    var image : URL?
    
    func initBlogModel(jsonData : [String:Any] ) -> BlogModel{
        self.id = jsonData["id"] as! Int
        self.date = Date().formattedToDate(stringDate: jsonData["date"] as! String)
        self.link = jsonData["link"] as! String
        self.image = URL(string: jsonData["jetpack_featured_media_url"] as! String)!
        
        var helperJSON = jsonData["title"] as! [String:Any]
        self.title = helperJSON["rendered"] as! String
        
        helperJSON = jsonData["content"] as! [String:Any]
        self.content = helperJSON["rendered"] as! String
        
        helperJSON = jsonData["excerpt"] as! [String:Any]
        self.intro = helperJSON["rendered"] as! String
        
        return self
    }
    
}