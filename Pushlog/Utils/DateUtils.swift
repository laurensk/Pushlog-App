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
    
    public static func dateToTimestamp(_ date: Date) -> UInt64 {
        return UInt64(date.timeIntervalSince1970 * 1000)
    }
    
    public static func timestampToDate(_ timestamp: UInt64) -> Date {
        return Date(timeIntervalSince1970: Double(timestamp) / 1000)
    }
    
    public static func timeRangeForDateFilter(_ dateFilter: DateFilter) -> (UInt64, UInt64) {
        
        var startDate = Date()
        let endDate = Date()
        
        switch dateFilter {
        case .Today:
            startDate = Calendar.current.date(byAdding: .hour, value: -24, to: endDate)!
            break
        case .Last7Days:
            startDate = Calendar.current.date(byAdding: .day, value: -7, to: endDate)!
            break
        case .ThisMonth:
            startDate = Calendar.current.date(byAdding: .month, value: -1, to: endDate)!
            break
        case .ThisYear:
            startDate = Calendar.current.date(byAdding: .year, value: -1, to: endDate)!
            break
        }
        
        return (dateToTimestamp(startDate), dateToTimestamp(endDate))
    }
    
}
