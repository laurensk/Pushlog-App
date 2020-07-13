//
//  LogListView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct LogListView: View {
    
    let log: Log
    
    @State private var showLogTokenSheet = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .shadow(radius: 3)
                .foregroundColor(Color("cardColor"))
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text("\(log.displayName)").fontWeight(.semibold).lineLimit(1)
                    Spacer()
                    Button(action: {
                        self.showLogTokenSheet.toggle()
                    }) {
                        Image(systemName: "lock.fill").foregroundColor(Color(UIColor.systemGray))
                    }.padding(.trailing, 10)
                    Image(systemName: "chevron.right").padding(.trailing, 5).foregroundColor(Color(UIColor.systemGray))
                }
            }.padding().padding(.top, 8).padding(.bottom, 8)
        }.padding(.bottom, 5)
        .sheet(isPresented: $showLogTokenSheet) {
            TokenSheetView(token: log.logToken)
        }
    }
}

struct LogListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
