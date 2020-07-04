//
//  ErrorHandling.swift
//  Pushlog
//
//  Created by Laurens on 04.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public enum PushlogError: String {
    case DisplayNameTooLong = "Display name is too long"
    case NetworkError = "A networking error occurred. Make sure you have an active internet connection or try again later."
    case UnknownError = "Unknown Error"
}

public class ErrorHandling {
    
    static let errorHandling = ErrorHandling()
    static let errorPresenter = ErrorPresenter()
    
    public func throwError(error: PushlogError, showError: Bool) {
        print("[PUSHLOG-ERROR] Error: \(error)")
        if showError {
            ErrorHandling.errorPresenter.presentErrorAlert(error: error)
        }
    }
    
    public func throwNSError(error: NSError, showError: Bool) {
        print("[PUSHLOG-ERROR] Error: \(error)")
        if showError {
            ErrorHandling.errorPresenter.presentCustomErrorAlert(error: error.localizedDescription)
        }
    }
    
}
