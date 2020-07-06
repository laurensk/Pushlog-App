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
