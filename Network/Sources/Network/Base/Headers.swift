//
//  File.swift
//  
//
//  Created by Semicolon on 12/12/2022.
//

import Foundation

class Headers {
    func authorizationHeader()-> [String: String]? {
        //        let userData = LocalStorage.shared.getUserModel()
        //        guard let userName = userData?.employee?.numWork, let password = userData?.employee?.authKey,
        //              let lang = LocalizationManager.shared.getLanguage()?.code else {
        //            return nil
        //        }
        
        let credentialData = "A000-15:A000-15".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: [String: String] =
        [
            "Content-Type": "application/x-www-form-urlencoded",
            "Cache-Control": "no-cache",
            "Authorization": "Basic \(base64Credentials)",
            "lang": "en"
        ]
        
        return headers
    }
}
