//
//  AppUser.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

struct AppUser: Codable {
    let loggedIn: Bool
    let userToken: String
    let userDisplayName: String
}
