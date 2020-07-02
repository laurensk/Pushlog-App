//
//  LogTitleView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct LogTitleView: View {
    
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
                HStack {
                    RoundedRectangle(cornerRadius: 4).frame(width: 80, height: 25).foregroundColor(color).overlay(Text("\(type)").foregroundColor(Color.white).fontWeight(.bold))
                    Text("\(DateUtils.getDateTimeString(date))").fontWeight(.semibold).foregroundColor(Color(UIColor.systemGray))
                }
                HStack(alignment: .top) {
                    Text("\(desc)").lineLimit(2)
                    Spacer()
                    Image(systemName: "chevron.right").padding(.trailing, 5).foregroundColor(Color(UIColor.systemGray))
                }
            }.padding()
        }.padding(.bottom, 5)
    }
}

struct LogTitleView_Previews: PreviewProvider {
    static var previews: some View {
        LogTitleView(type: "Error", color: Color(UIColor.systemRed), date: Date(), desc: "SSH Host Authentication Failed for this stupid backend")
    }
}
