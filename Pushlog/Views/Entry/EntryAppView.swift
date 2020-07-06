//
//  LogAppView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct EntryAppView: View {
    
    let logName: String
    let type: String
    let color: Color
    let date: Date
    let desc: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .shadow(radius: 3)
                .foregroundColor(Color("cardColor"))
            VStack(alignment: .leading) {
                Text("\(logName)").fontWeight(.semibold).font(.system(size: 20)).padding(.bottom, -6)
                HStack {
                    RoundedRectangle(cornerRadius: 4).frame(width: 80, height: 25).foregroundColor(color).overlay(Text("\(type)").foregroundColor(Color.white).fontWeight(.bold))
                    Text("\(DateUtils.getDateTimeString(date))").fontWeight(.semibold).foregroundColor(Color(UIColor.systemGray))
                    Spacer()
                    Image(systemName: "chevron.right").padding(.trailing, 5).foregroundColor(Color(UIColor.systemGray))
                }
                Text("\(desc)").lineLimit(1)
            }.padding()
        }.padding(.bottom, 5)
    }
}

struct EntryAppView_Previews: PreviewProvider {
    static var previews: some View {
        EntryAppView(logName: "Node.js Playzlib Backend", type: "Error", color: Color(UIColor.systemRed), date: Date(), desc: "SSH Host Authentication Failed for this stupid backend")
    }
}
