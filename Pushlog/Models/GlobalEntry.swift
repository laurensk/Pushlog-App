//
//  GlobalEntry.swift
//  Pushlog
//
//  Created by Laurens on 07.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

struct GlobalEntry: Codable, Hashable {
    let log: Log
    let entry: Entry
}
