//
//  IntroFeatureViews.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct IntroFeatureViews: View {
    var body: some View {
        VStack(alignment: .leading) {
            IntroFeatureView(title: "Token", subTitle: "Using Pushlog doesn't require a user account. You will get a unique token used for authentication.", imageName: "lock")
            IntroFeatureView(title: "Log in or Sign up", subTitle: "Click on \"Log in\" if you've already used Pushlog. Select \"Sign up\" to create a new token.", imageName: "person.crop.square")
            IntroFeatureView(title: "Custom API Endpoint", subTitle: "If you prefer hosting the Pushlog API on your own server, you can setup a custom API endpoint.", imageName: "checkmark.square")
        }
        .padding(.horizontal)
    }
}

struct IntroFeatureViews_Previews: PreviewProvider {
    static var previews: some View {
        IntroFeatureViews()
    }
}
