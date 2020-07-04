//
//  ApiService.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public class ApiService {
    
    // MARK: - API Endpoint
    
    private var apiUrl: URL = ApiUrlPersistence.getApiUrl().apiUrl
    
    func setApiUrl(_ newApiUrl: URL) {
        apiUrl = newApiUrl
        ApiUrlPersistence.setApiUrl(apiUrl: newApiUrl)
    }
    
    // MARK: - User
    
    func createUser(displayName: String, completion: @escaping (Any?, PushlogError?, Error?) -> Void) {
        if displayName.count < 1 { completion(nil, PushlogError.DisplayNameNotEntered, nil); return }
        if displayName.count > 32 { completion(nil, PushlogError.DisplayNameTooLong, nil); return }
        ApiRequest.postRequest(apiUrl: apiUrl, path: "/user", body: ["displayName": "\(displayName)"], type: User.self, completion: completion)
    }
    
    func loginUser(token: String, completion: @escaping (Any?, PushlogError?, Error?) -> Void) {
        if token.isEmpty { completion(nil, PushlogError.TokenIsEmpty, nil); return }
        ApiRequest.getRequest(apiUrl: apiUrl, path: "/user/\(token)", type: User.self, completion: completion)
    }
    
}
