//
//  Date+Extensions.swift
//
//
//  Created by Pavel Koyushev on 13.11.2023.
//

import Foundation

public extension Date {
    
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        Calendar.current.isDateInYesterday(self)
    }
    
    var isTomorrow: Bool {
        Calendar.current.isDateInTomorrow(self)
    }
    
    var nextDay: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var previousDay: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    var year: Int {
        Calendar.current.component(.year, from: self)
    }
    
    var priorYearDate: Date {
        Calendar.current.date(byAdding: .year, value: -1, to: self)!
    }
    
    var priorYear: Int {
        Calendar.current.component(.year, from: self) - 1
    }
}

public extension Date {
    
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
    
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
    
    var hour: Int {
        Calendar.current.component(.hour, from: self)
    }
    
    var minute: Int {
        Calendar.current.component(.minute, from: self)
    }
    
    var seconds: Int {
        Calendar.current.component(.second, from: self)
    }
}
