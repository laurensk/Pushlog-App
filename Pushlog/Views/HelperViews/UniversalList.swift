//
//  UniversalList.swift
//  Pushlog
//
//  Created by Laurens on 10.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct UniversalList<Content: View>: View {
    
    let viewBuilder: () -> Content
    
    init(@ViewBuilder viewBuilder: @escaping () -> Content) {
        self.viewBuilder = viewBuilder
    }
    
    var body: some View {
        
        if #available(macOS 10.16, iOS 14, *) {
            List {
                LazyVStack {
                    viewBuilder().padding(.bottom, 5)
                }
            }
        } else {
            List {
                viewBuilder()
            }.listRowInsets(EdgeInsets())
            .buttonStyle(BorderlessButtonStyle())
        }
        
    }
}
