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
    
    static func sendMail() {
        UIApplication.shared.open(URL(string: "mailto:pushlog@projects.laurensk.at")!)
    }
    
    static func openURL(url: String) {
        UIApplication.shared.open(URL(string: url)!)
    }
    
    static func logOut(update: () -> Void) {
        UserPersistence.setUser(loggedIn: false, userToken: "", userDisplayName: "")
        withAnimation {
            update()
        }
    }
    
}
