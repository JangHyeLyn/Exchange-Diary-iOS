//
//  ServiceNetwork.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/07/02.
//

import Foundation

class ServiceNetwork {
    class func request<T: Codable> (api: ServiceAPI, completion: @escaping (Result<ServiceResponse<T>, Error>) -> Void) {
        let url = URL(string: "\(api.baseURL)\(api.path)")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = api.method.rawValue
        urlRequest.addValue(api.header["Authorization"]!, forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
                return
            }
            
            guard response != nil, let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    let responseObject = try JSONDecoder().decode(ServiceResponse<T>.self, from: data)
                    completion(.success(responseObject))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}
