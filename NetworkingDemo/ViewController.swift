//
//  ViewController.swift
//  NetworkingDemo
//
//  Created by Semicolon on 11/12/2022.
//

import UIKit
import Network

class ViewController: UIViewController {
    
    let authAPI: AuthAPIProtocol = AuthAPI()
    let homeAPI: HomeAPIProtocol = HomeAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        login()
    }
}

extension ViewController {
    private func login() {
        let body = LoginDataBody(phone: "0100000000", passowrd: "123456")
        
        authAPI.login(loginBody: body) {[weak self] result in
            guard let _ = self else { return }
            
            switch result {
            case .success(let response):
                if response?.message == ErrorMessage.authenticationFaild.rawValue {
                    print("show Alert for Authentication Faild")
                }
                else {
                    print("reponse", response as Any)
                }
            case .failure(let error):
                print("err", error)
            }
        }
    }
}


extension ViewController {
    private func attendRespo() {
        homeAPI.attendanceReport(offset: "0") { result in
            switch result {
            case .success(let res):
                if res?.message == ErrorMessage.authenticationFaild.rawValue {
                    //show alert
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }
}
