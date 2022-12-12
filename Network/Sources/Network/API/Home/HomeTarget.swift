//
//  File.swift
//  
//
//  Created by Semicolon on 12/12/2022.
//

import Foundation
import Alamofire

public enum HomeTarget {
    case attendanceReport(offset: String)
    case salaryDetails
}

extension HomeTarget: TargetType {
    public var baseURL: String {
        return EndPoints.baseURL.value
    }
    
    public var path: String {
        switch self {
        case .attendanceReport(offset: let offset):
            return "TimesheetsEmployee/appAttendanceReport/\(offset)"
        case .salaryDetails:
            return "salaryDetails"
        }
    }
    
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .attendanceReport:
            return .get
        case .salaryDetails:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .attendanceReport:
            return .requestPlain
        case .salaryDetails:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .attendanceReport:
            return Headers().authorizationHeader()
        case .salaryDetails:
            return [:]
        }
    }
}

