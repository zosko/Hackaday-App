//
//  Date+Extension.swift
//  Hackaday_App
//
//  Created by Bosko Petreski on 1/9/20.
//  Copyright © 2020 Bosko Petreski. All rights reserved.
//

import UIKit

extension Date {
    func formattedToDate(stringDate: String) -> Date{
        
        let dateFormat : DateFormatter = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        
        return dateFormat.date(from: stringDate) ?? Date()
    }
    
    func formattedDate(dateInput: Date) -> String{
        let dateFormat : DateFormatter = DateFormatter()
        dateFormat.dateFormat = "MMMM d, yyyy"
        return dateFormat.string(from: dateInput)
    }
}
