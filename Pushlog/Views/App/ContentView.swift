//
//  ContentView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var appUser: AppUser = UserPersistence.getUser()
    
    var body: some View {
        VStack {
            if appUser.loggedIn == true {
                TabBarView(update: updateAppUser)
            } else {
                IntroductionView(update: updateAppUser)
            }
        }
    }
    
    func updateAppUser() {
        appUser = UserPersistence.getUser()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
