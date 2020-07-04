//
//  Networking.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public class Networking {
    
    private var apiUrl: String = ApiUrlPersistence.getApiUrl().apiUrl
    
    public func setApiUrl(_ newApiUrl: String) {
        apiUrl = newApiUrl
        ApiUrlPersistence.setApiUrl(apiUrl: newApiUrl)
    }
    
    // gimme some data from the correct api url
    
}
