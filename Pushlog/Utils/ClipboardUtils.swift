//
//  ClipboardUtils.swift
//  Pushlog
//
//  Created by Laurens on 07.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation
import UIKit

public class ClipboardUtils {
    static func writeToken(token: String) {
        UIPasteboard.general.string = token
    }
}
