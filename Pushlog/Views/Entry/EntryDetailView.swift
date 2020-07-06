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
    
    var body: some View {
        Text("hello, \(entry.level)")
    }
}

struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
