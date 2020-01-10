//
//  AuthorModel.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/10/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

class AuthorModel: NSObject {
    var name : String = ""
    
    func initAuthorModel(jsonData : [String:Any] ) -> AuthorModel{
        self.name = jsonData["name"] as! String
        
        return self
    }
}
