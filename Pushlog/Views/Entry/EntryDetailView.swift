//
//  EntryDetailView.swift
//  Pushlog
//
//  Created by Laurens on 06.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct EntryDetailView: View {
    
    let entry: Entry
    let log: Log
    
    var color: Color
    
    init(entry: Entry, log: Log) {
        self.entry = entry
        self.log = log
        
        if entry.level.lowercased() == "error" {
            self.color = Color(UIColor.systemRed)
        } else if entry.level.lowercased() == "info" {
            self.color = Color(UIColor.systemYellow)
        } else {
            self.color = Color(UIColor.systemGray)
        }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Text("\(log.displayName)").fontWeight(.semibold).font(.title).lineLimit(1)
                    Spacer()
                }.padding([.leading, .trailing]).padding(.top, 30)
                
                HStack {
                    RoundedRectangle(cornerRadius: 4).frame(width: 100, height: 25).foregroundColor(color).overlay(Text("\(entry.level)").foregroundColor(Color.white).fontWeight(.bold)).padding(.trailing, 10)
                    Text("\(DateUtils.getDateTimeString(DateUtils.timestampToDate(entry.timestamp)))").fontWeight(.semibold).foregroundColor(Color(UIColor.systemGray))
                    Spacer()
                }.padding([.leading, .trailing])
                HStack {
                    Text("\(entry.value)").multilineTextAlignment(.leading)
                    Spacer()
                }.padding().padding(.bottom, 20)
            }
        }.navigationBarTitle("Entry", displayMode: .inline)
    }
}

struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetailView(entry: Entry(timestamp: 12121212, value: "Hello darkness my old friend, i've come to talk with your again...", level: "Error"), log: Log(logToken: "lol", displayName: "Node JS Backend"))
    }
}
