//
//  File.swift
//  
//
//  Created by Semicolon on 12/12/2022.
//

import Foundation

public protocol HomeAPIProtocol {
    func attendanceReport(offset: String, completion: @escaping (Result<BaseResponse<[AttendanceReportData]>?, Error>) -> Void)
    func salaryDetails(completion: @escaping (Result<BaseResponse<AttendanceReportData>?, Error>)-> Void)
}

public class HomeAPI: BaseAPI<HomeTarget>, HomeAPIProtocol {
    public override init() {}
}

extension HomeAPI {
   public func attendanceReport(offset: String, completion: @escaping (Result<BaseResponse<[AttendanceReportData]>?, Error>) -> Void) {
        connectWithServer(target: .attendanceReport(offset: offset)) { result in
            completion(result)
        }
    }
}

extension HomeAPI {
    public func salaryDetails(completion: @escaping (Result<BaseResponse<AttendanceReportData>?, Error>)-> Void) {
        connectWithServer(target: .salaryDetails) { reuslt in
            completion(reuslt)
        }
    }
}
