//
//  IntroductionView.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct IntroductionView: View {
    
    let update: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            
            Spacer()
            
            IntroHeaderView()
            
            IntroFeatureViews()
            
            Spacer(minLength: 40)
            
            IntroSingleBtnView(action: signUp)
            
            IntroBtnRowView(actionLeft: customAPI, actionRight: login)
            
        }
    }
    
    func signUp() {
        
    }
    
    func customAPI() {
        
        let service = ApiService()
        service.createUser(displayName: "laurensTest", completion: { user, error in
            if error == nil {
                if let user = user {
                    print(user.displayName)
                }
            } else {
                print(error!.rawValue)
            }
        })
    }
    
    func login() {
        
        // debug
        UserPersistence.setUser(loggedIn: true, userToken: "", userDisplayName: "Laurens")
        
        self.update()
    }
}
