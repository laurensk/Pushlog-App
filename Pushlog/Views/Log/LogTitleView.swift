//
//  LogTitleView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct LogTitleView: View {
    
    let entry: Entry
    
    var color: Color
    
    init(entry: Entry) {
        self.entry = entry
        
        if entry.level.lowercased() == "error" {
            self.color = Color(UIColor.systemRed)
        } else if entry.level.lowercased() == "info" {
            self.color = Color(UIColor.systemYellow)
        } else {
            self.color = Color(UIColor.systemGray)
        }
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .shadow(radius: 3)
                .foregroundColor(Color("cardColor"))
            VStack(alignment: .leading) {
                HStack {
                    RoundedRectangle(cornerRadius: 4).frame(width: 80, height: 25).foregroundColor(color).overlay(Text("\(entry.level)").foregroundColor(Color.white).fontWeight(.bold))
                    Text("\(DateUtils.getDateTimeString(DateUtils.timestampToDate(entry.timestamp)))").fontWeight(.semibold).foregroundColor(Color(UIColor.systemGray))
                }
                HStack(alignment: .top) {
                    Text("\(entry.value)").lineLimit(2)
                    Spacer()
                    Image(systemName: "chevron.right").padding(.trailing, 5).foregroundColor(Color(UIColor.systemGray))
                }
            }.padding()
        }.padding(.bottom, 5)
    }
}

struct LogTitleView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
