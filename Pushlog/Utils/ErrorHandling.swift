//
//  ErrorHandling.swift
//  Pushlog
//
//  Created by Laurens on 04.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import Foundation

public enum PushlogError: String {
    
    // MARK: Login/Sign up
    case DisplayNameTooLong = "The display name you've entered is too long. It must be smaller than 32 characters."
    case DisplayNameNotEntered = "Please enter a display name for your user account."
    case TokenIsEmpty = "Please enter a token."
    case TokenInvalid = "The token you've entered is not valid. Please try again or sign up for a new token."
    
    // MARK: Networking
    case NetworkError = "A networking error occurred. Make sure you have an active internet connection or try again later."
    
    // MARK: Unknown Error
    case UnknownError = "A unknown error occurred. If you think that's our vault, please file a bug."
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
    
    public func throwCustomError(error: String, showError: Bool) {
        print("[PUSHLOG-ERROR] Error: \(error)")
        if showError {
            ErrorHandling.errorPresenter.presentCustomErrorAlert(error: error)
        }
    }
    
}
