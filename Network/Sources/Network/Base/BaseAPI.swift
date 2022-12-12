//
//  File.swift
//  
//
//  Created by Semicolon on 12/12/2022.
//

import Foundation
import Alamofire

public class BaseAPI<T: TargetType> {
    
    func connectWithServer<M: Decodable>(target: T, completion:@escaping (Result<M?, Error>) -> Void) {
        let url = target.baseURL + target.path
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.task)
        
        AF.request(url , method: method , parameters: params.0, encoding: params.1, headers: headers).response { (response) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success(_):
                guard let data = response.data else { return }
                do {
                    let json = try JSONDecoder().decode(M.self, from: data)
                    completion(.success(json))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
}
