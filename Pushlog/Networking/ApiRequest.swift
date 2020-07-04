//
//  ApiRequest.swift
//  Pushlog
//
//  Created by Laurens on 04.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public class ApiRequest {
    
    static func postRequest<T: Codable>(apiUrl: URL, path: String, body: [String: Any], type: T.Type, completion: @escaping (User?, PushlogError?) -> Void) {
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: apiUrl.appendingPathComponent(path))
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(type.self, from: data) {
                    completion(decodedResponse as? User, nil)
                    return
                }
            }
            completion(nil, PushlogError.UnknownError)
        }.resume()
        
    }
    
    static func getRequest<T: Codable>(apiUrl: URL, path: String, body: [String: Any], type: T.Type, completion: @escaping (User?, PushlogError?) -> Void) {
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: apiUrl.appendingPathComponent(path))
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(type.self, from: data) {
                    completion(decodedResponse as? User, nil)
                    return
                }
            }
            completion(nil, PushlogError.UnknownError)
        }.resume()
        
    }
    
}
