//
//  IntroSingleBtnView.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct IntroSingleBtnView: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            self.action()
        }) {
            Text("Sign Up")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color("lightBlue")))
                .padding(.bottom)
        }.padding(.horizontal)
    }
}
