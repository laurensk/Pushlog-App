//
//  SafariView.swift
//  Pushlog
//
//  Created by Laurens on 05.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI
import UIKit
import SafariServices

struct SafariView {
    
    public func openURL(url: String) {
        DispatchQueue.main.async {
            let vc = UIApplication.shared.windows.first!.rootViewController
            let safariVc = SFSafariViewController(url: URL(string: url)!)
            vc!.present(safariVc, animated: true, completion: nil)
        }
    }
    
}
