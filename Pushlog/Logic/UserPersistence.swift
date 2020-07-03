//
//  UserPersistence.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public class UserPersistence {
    
    static func getUser() -> AppUser {
        let defaults = UserDefaults.standard
        
        var appUser: AppUser!
        if let data = defaults.value(forKey: "appUser") as? Data {
            appUser = try? PropertyListDecoder().decode(AppUser.self, from: data)
            return appUser!
        } else {
            return AppUser(loggedIn: false, userToken: "", userDisplayName: "")
        }
        
    }
    
    static func setUser(loggedIn: Bool, userToken: String, userDisplayName: String) {
        let defaults = UserDefaults.standard
        let appUser: AppUser = AppUser(loggedIn: loggedIn, userToken: userToken, userDisplayName: userDisplayName)
        defaults.set(try? PropertyListEncoder().encode(appUser), forKey: "appUser")
    }
    
}
