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
    
    func getUser(token: String, completion: @escaping (Any?, PushlogError?, Error?) -> Void) {
        ApiRequest.getRequest(apiUrl: apiUrl, path: "/user/\(token)", type: User.self, completion: completion)
    }
    
    // MARK: - Dashboard
    
    // MARK: - Entries
    
    func getLogEntries(logToken: String, startTime: UInt64, endTime: UInt64, completion: @escaping (Any?, PushlogError?, Error?) -> Void) {
        ApiRequest.getRequest(apiUrl: apiUrl, path: "/log/\(logToken)/from/\(startTime)/until/\(endTime)", type: [Entry].self, completion: completion)
    }
    
    func getAllEntries(startTime: UInt64, endTime: UInt64, completion: @escaping (Any?, PushlogError?, Error?) -> Void) {
        var globalEntries: [GlobalEntry] = []
        getLogs(completion: { logs, localError, apiError in
            if let logs = logs as? [Log] {
                for log in logs {
                    self.getLogEntries(logToken: log.logToken, startTime: startTime, endTime: endTime, completion: { entries, localError, apiError in
                        if let entries = entries as? [Entry] {
                            for entry in entries {
                                globalEntries.append(GlobalEntry(log: log, entry: entry))
                            }
                            globalEntries = globalEntries.sorted(by: { $0.entry.timestamp > $1.entry.timestamp })
                            completion(globalEntries, localError, apiError)
                        } else {
                            completion(nil, localError, apiError)
                        }
                    })
                }
            } else {
                completion(nil, localError, apiError)
            }
        })
    }
    
    // MARK: - Logs
    
    func getLogs(completion: @escaping (Any?, PushlogError?, Error?) -> Void) {
        let userDetails = UserPersistence.getUser()
        getUser(token: userDetails.userToken, completion: { user, localError, apiError in
            if let user = user as? User {
                completion(user.logs, localError, apiError)
            } else {
                completion(nil, localError, apiError)
            }
        })
    }
    
}
