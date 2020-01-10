//
//  UILabel+Extension.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/10/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

extension UILabel {
    func makeYellowText(text: String) {
        let fullString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font: self.font!])
        let yellowText: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.systemYellow]
        let range = (text as NSString).range(of: "…read more\n")
        fullString.addAttributes(yellowText, range: range)
        self.attributedText = fullString
    }
}
