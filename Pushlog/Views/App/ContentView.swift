//
//  ContentView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            if UserPersistence.getUser().loggedIn == true {
                TabBarView()
            } else {
                IntroductionView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
