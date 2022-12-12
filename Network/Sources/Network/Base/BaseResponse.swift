//
//  File.swift
//  
//
//  Created by Semicolon on 11/12/2022.
//

import Foundation

// MARK: - BaseResponse
public struct BaseResponse<T: Codable>: Codable {
    public let success: Bool?
    public let message: String?
    public let data: T?
    
    public init(success: Bool?, message: String?, data: Codable?) {
        self.success = success
        self.message = message
        self.data = data as? T
    }
}
