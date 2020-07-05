//
//  User.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

struct User: Codable {
    let userToken: String
    let displayName: String
    let logs: [Log]
}
