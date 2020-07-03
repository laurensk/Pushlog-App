//
//  IntroBtnRowView.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct IntroBtnRowView: View {
    
    let actionLeft: () -> Void
    let actionRight: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                self.actionLeft()
            }) {
                Text("Custom API")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color("gradient2")))
                    .padding(.bottom)
            }.padding(.leading).padding(.trailing, 4)
            
            Button(action: {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                self.actionRight()
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color("gradient2")))
                    .padding(.bottom)
            }.padding(.trailing).padding(.leading, 4)
        }.padding(.bottom)
    }
}
