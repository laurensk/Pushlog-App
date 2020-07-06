//
//  Binding+Extensions.swift
//  Pushlog
//
//  Created by Laurens on 06.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation
import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}
