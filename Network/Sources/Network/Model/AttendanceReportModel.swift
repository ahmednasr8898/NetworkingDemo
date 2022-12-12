//
//  AttendanceReportModel.swift
//  HRApp
//
//  Created by Semicolon on 20/10/2022.
//

import Foundation

// MARK: - AttendanceReportData
public struct AttendanceReportData: Codable {
    public let timesheetsEmployee: TimesheetsEmployee?
    public let timesheets: Timesheets?
    
    enum CodingKeys: String, CodingKey {
        case timesheetsEmployee = "TimesheetsEmployee"
        case timesheets = "Timesheets"
    }
}

// MARK: - Timesheets
public struct Timesheets: Codable {
    public let id: String?
}

// MARK: - TimesheetsEmployee
public struct TimesheetsEmployee: Codable {
    public let id: String?
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}
