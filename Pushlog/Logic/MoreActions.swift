//
//  MoreActions.swift
//  Pushlog
//
//  Created by Laurens on 05.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

public class MoreActions {
    
    static func showUserToken() {
        let appUser = UserPersistence.getUser()
        print(appUser.userToken)
    }
    
    static func addToPasswordManager() {
        let appUser = UserPersistence.getUser()
        let username = appUser.userDisplayName
        let password = appUser.userToken
        let url = "onepassword://"
        UIApplication.shared.open(URL(string: url)!)
    }
    
    static func deleteAccountAndData() {
        print("not available...")
    }
    
    static func logOut(update: () -> Void) {
        UserPersistence.setUser(loggedIn: false, userToken: "", userDisplayName: "")
        withAnimation {
            update()
        }
    }
    
}
