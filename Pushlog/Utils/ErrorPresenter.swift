//
//  ErrorPresenter.swift
//  Pushlog
//
//  Created by Laurens on 04.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation
import UIKit

public class ErrorPresenter {
    
    public func presentErrorAlert(error: PushlogError) {
        DispatchQueue.main.async {
            let vc = UIApplication.shared.windows.first!.rootViewController
            let alert = UIAlertController(title: "Error", message: "\(error.rawValue)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
            vc!.present(alert, animated: true, completion: nil)
        }
    }
    
    public func presentCustomErrorAlert(error: String) {
        DispatchQueue.main.async {
            let vc = UIApplication.shared.windows.first!.rootViewController
            let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
            vc!.present(alert, animated: true, completion: nil)
        }
    }
}

