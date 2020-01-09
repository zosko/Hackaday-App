//
//  ViewController.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/9/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {

    @IBAction func onBtnBlog(){
        let controller : BlogsScreen = (self.storyboard?.instantiateViewController(identifier: "BlogsScreen"))!
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

