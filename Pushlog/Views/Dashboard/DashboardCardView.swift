//
//  DashboardCardView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct DashboardCardView: View {
    
    let title: String
    let count: Int
    let color: UIColor
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack(alignment: .leading) {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("cardColor"))
                        .shadow(radius: 3)
                        .frame(height: 150)
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("cardColor"))
                        .shadow(radius: 3)
                        .aspectRatio(1.0, contentMode: .fit)
                }
                VStack(alignment: .leading) {
                    Text("\(title)").font(.system(size: 20)).fontWeight(.semibold).padding(.bottom, 5).foregroundColor(Color(color))
                    Text("\(count)").font(.system(size: 40, design: .rounded)).fontWeight(.bold).foregroundColor(Color("dashboardCardTextColor"))
                }.padding(25)
            }
        }
    }
}

struct DashboardCardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCardView(title: "Apps", count: 13, color: UIColor.systemRed, action: {})
    }
}
