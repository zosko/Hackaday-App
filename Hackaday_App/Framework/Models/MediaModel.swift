//
//  MediaModel.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/10/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

class MediaModel: NSObject {
    var link : URL?
    
    func initMediaModel(jsonData : [String:Any] ) -> MediaModel{
        let imageLink = jsonData["source_url"] as! String
        self.link = URL(string: imageLink)!
        
        return self
    }
}
