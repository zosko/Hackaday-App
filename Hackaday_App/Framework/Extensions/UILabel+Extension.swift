//
//  UILabel+Extension.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/10/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

extension UILabel {
    func makeYellowText(fullText: String, toBeYellow:String) {
        let fullString = NSMutableAttributedString(string: fullText, attributes: [NSAttributedString.Key.font: self.font!])
        let yellowText: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.systemYellow]
        let range = (fullText as NSString).range(of: toBeYellow)
        fullString.addAttributes(yellowText, range: range)
        self.attributedText = fullString
    }
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: self.font as Any], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }  
}
