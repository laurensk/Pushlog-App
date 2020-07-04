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
    
    func createUser(displayName: String, completion: @escaping (User?, PushlogError?) -> Void) {
        if displayName.count > 32 { completion(nil, PushlogError.DisplayNameTooLong); return }
        ApiRequest.postRequest(apiUrl: apiUrl, path: "/user", body: ["displayName": "\(displayName)"], type: User.self, completion: completion)
    }
    
}
