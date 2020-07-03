//
//  Extensions+Modifiers.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

extension LinearGradient {
    static var pushlogGradient = LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2")]), startPoint: .top, endPoint: .bottom)
    static var pushlogGradientReversed = LinearGradient(gradient: Gradient(colors: [Color("gradient2"), Color("gradient1")]), startPoint: .top, endPoint: .bottom)
}
