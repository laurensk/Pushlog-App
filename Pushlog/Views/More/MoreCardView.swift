//
//  MoreCardView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct MoreCardView: View {
    
    var childView: AnyView
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .shadow(radius: 3)
                .foregroundColor(Color("cardColor"))
            childView
        }.padding(.bottom, 5)
    }
}

struct MoreCardView_Previews: PreviewProvider {
    static var previews: some View {
        MoreCardView(childView: AnyView(EmptyView()))
    }
}
