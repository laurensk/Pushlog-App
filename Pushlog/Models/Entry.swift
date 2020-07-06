//
//  Entry.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

struct Entry: Codable, Hashable {
    let timestamp: UInt64
    let value: String
    let level: String
}
