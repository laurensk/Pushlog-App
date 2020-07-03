//
//  IntroHeaderView.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct IntroHeaderView: View {
    var body: some View {
        VStack {
            Image("pushlog_icon_gradient")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)
                .accessibility(hidden: true).padding(.bottom, 20)
            
            Text("Welcome to")
                .fontWeight(.black)
                .font(.system(size: 36))
            
            Text("Pushlog")
                .fontWeight(.black)
                .font(.system(size: 36))
                .foregroundColor(Color("gradient2"))
        }
    }
}

struct IntroHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        IntroHeaderView()
    }
}
