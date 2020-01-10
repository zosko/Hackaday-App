//
//  MediaModel.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/10/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

class MediaModel: NSObject {
    var link : String = ""
    
    func initMediaModel(jsonData : [String:Any] ) -> MediaModel{
        self.link = jsonData["source_url"] as! String
        
        return self
    }
}
