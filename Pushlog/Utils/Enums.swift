//
//  Enums.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public enum DateFilter {
    case Today
    case Last7Days
    case ThisMonth
    case ThisYear
}

public enum EntryFilter {
    case All
    case Info
    case Errors
}
