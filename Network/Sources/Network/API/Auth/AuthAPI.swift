//
//  File.swift
//  
//
//  Created by Semicolon on 11/12/2022.
//

import Foundation

public protocol AuthAPIProtocol {
    func login(loginBody: LoginDataBody, completion: @escaping (Result<BaseResponse<LoginData>?, Error>) -> Void)
    func forgotPassword(completion: @escaping (Result<BaseResponse<LoginData>?, Error>) -> Void)
}

public class AuthAPI: BaseAPI<AuthTarget>, AuthAPIProtocol {
    public override init() {}
 
}

//MARK: - login
//
extension AuthAPI {
    public func login(loginBody: LoginDataBody, completion: @escaping (Result<BaseResponse<LoginData>?, Error>) -> Void) {
        connectWithServer(target: .login(loginBody: loginBody)) { result in
            completion(result)
        }
    }
}

//MARK: - forgot password
//
extension AuthAPI {
    public func forgotPassword(completion: @escaping (Result<BaseResponse<LoginData>?, Error>) -> Void) {
        connectWithServer(target: .forgotPassword) { result in
            completion(result)
        }
    }
}
