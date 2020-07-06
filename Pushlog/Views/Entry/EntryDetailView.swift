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
    
    var body: some View {
        VStack {
            ScrollView {
                Text("\(log.displayName)")
                HStack {
                    Text("\(entry.level)")
                    Text("\(DateUtils.getDateTimeString(DateUtils.timestampToDate(entry.timestamp)))")
                }
                Text("\(entry.value)")
            }
        }.navigationBarTitle("Entry", displayMode: .inline)
    }
}

struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetailView(entry: Entry(timestamp: 12121212, value: "Hello darkness my old friend, i've come to talk with your again...", level: "Error"), log: Log(logToken: "lol", displayName: "Node JS Backend"))
    }
}
