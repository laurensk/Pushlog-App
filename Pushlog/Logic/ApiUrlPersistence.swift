//
//  ApiUrlPersistence.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public class ApiUrlPersistence {
    
    static let gebesApiUrl = "https://api.gebes.eu/pushlog/"
    
    static func getApiUrl() -> CustomApi {
        let defaults = UserDefaults.standard
        
        var customApi: CustomApi!
        if let data = defaults.value(forKey: "customApi") as? Data {
            customApi = try? PropertyListDecoder().decode(CustomApi.self, from: data)
            return customApi!
        } else {
            return CustomApi(isSet: false, apiUrl: gebesApiUrl)
        }
        
    }
    
    static func setApiUrl(apiUrl: String) {
        let defaults = UserDefaults.standard
        let customApi: CustomApi = CustomApi(isSet: true, apiUrl: apiUrl)
        defaults.set(try? PropertyListEncoder().encode(customApi), forKey: "customApi")
    }
    
}
