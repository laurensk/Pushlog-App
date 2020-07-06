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
    
    let update: () -> Void
    
    @State private var tabBarSelection: TabBarSelection = .Dashboard
    
    @State private var dateFilter: DateFilter = .Last7Days
    @State private var entryFilter: EntryFilter = .All
    
    var body: some View {
        TabView(selection: $tabBarSelection) {
            DashboardView(tabBarSelection: $tabBarSelection, dateFilter: $dateFilter, entryFilter: $entryFilter)
                .tabItem {
                    Image(systemName: "speedometer").imageScale(.large)
                    Text("Dashboard")
            }.tag(TabBarSelection.Dashboard)
            EntriesView(dateFilter: $dateFilter, entryFilter: $entryFilter)
                .tabItem {
                    Image(systemName: "list.dash").imageScale(.large)
                    Text("Entries")
            }.tag(TabBarSelection.Logs)
            LogsView(dateFilter: $dateFilter, entryFilter: $entryFilter)
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill").imageScale(.large)
                    Text("Logs")
            }.tag(TabBarSelection.Apps)
            MoreView(update: update)
                .tabItem {
                    Image(systemName: "ellipsis").imageScale(.large)
                    Text("More")
            }.tag(TabBarSelection.More)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
