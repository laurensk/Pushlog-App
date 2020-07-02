//
//  TabBarView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

public enum TabBarSelection: Hashable {
    case Dashboard
    case Logs
    case Apps
    case More
}

struct TabBarView: View {
    
    @State private var tabBarSelection: TabBarSelection = .Dashboard
    
    var body: some View {
        TabView(selection: $tabBarSelection) {
            DashboardView(tabBarSelection: $tabBarSelection)
                .tabItem {
                    Image(systemName: "speedometer").imageScale(.large)
                    Text("Dashboard")
            }.tag(TabBarSelection.Dashboard)
            LogsView()
                .tabItem {
                    Image(systemName: "list.dash").imageScale(.large)
                    Text("Logs")
            }.tag(TabBarSelection.Logs)
            AppsView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill").imageScale(.large)
                    Text("Apps")
            }.tag(TabBarSelection.Apps)
            MoreView()
                .tabItem {
                    Image(systemName: "ellipsis").imageScale(.large)
                    Text("More")
            }.tag(TabBarSelection.More)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
