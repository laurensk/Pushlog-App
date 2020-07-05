//
//  MoreTutorialView.swift
//  Pushlog
//
//  Created by Laurens on 05.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct MoreTutorialView: View {
    
    let text: String
    let action: () -> Void
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: action) {
            if colorScheme == .dark {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: colorScheme == .dark ? 1.5 : 0)
                .frame(height: 60).shadow(radius: 2)
                .foregroundColor(Color("cardColor"))
                    .overlay(Text(text).foregroundColor(Color(UIColor.white)))
            } else {
             RoundedRectangle(cornerRadius: 5)
                .frame(height: 60).shadow(radius: 2)
                .foregroundColor(Color("cardColor"))
                .overlay(Text(text).foregroundColor(Color(UIColor.darkText)))
            }
        }
    }
}

struct MoreTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
