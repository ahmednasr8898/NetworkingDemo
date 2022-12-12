////
////  File.swift
////
////
////  Created by Semicolon on 11/12/2022.
////
//
import Foundation
import Alamofire

public enum AuthTarget {
    case login(loginBody: LoginDataBody)
    case forgotPassword
}

extension AuthTarget: TargetType {
    public var baseURL: String {
        switch self {
        default:
            return EndPoints.baseURL.value
        }
    }
    
    public var path: String {
        switch self {
        case .login:
            return "Employees/appLogin"
        case .forgotPassword:
            return "ForgotPaswword" // worng path
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .forgotPassword:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .login(loginBody: let loginBody):
            let parameters = try! loginBody.asDictionary()
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .forgotPassword:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}

