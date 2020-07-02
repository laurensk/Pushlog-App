//
//  DateUtils.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public class DateUtils {
    
    public static func getDateString(_ date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"

        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale.current
        
        return formatter.string(from: date)
        
    }
    
    public static func getTimeString(_ date: Date) -> String {
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        return "\(hour):\(minutes)"
        
    }
    
    public static func getDateTimeString(_ date: Date) -> String {
        return "\(getDateString(date)) \(getTimeString(date))"
    }
    
}
