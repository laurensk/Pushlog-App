//
//  DashboardView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI
import SwiftUICustomNavigationLink

struct DashboardView: View {
    
    @Binding var tabBarSelection: TabBarSelection
    
    @Binding var dateFilter: DateFilter
    @Binding var entryFilter: EntryFilter
    
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    VStack {
                        Picker(selection: $dateFilter, label: EmptyView()) {
                            Text("Today").tag(DateFilter.Today)
                            Text("Last 7 Days").tag(DateFilter.Last7Days)
                            Text("This Month").tag(DateFilter.ThisMonth)
                            Text("This Year").tag(DateFilter.ThisYear)
                        }.pickerStyle(SegmentedPickerStyle())
                    }.padding(.top, 5).padding(.bottom, 7)
                    HStack {
                        DashboardCardView(title: "Entries", count: 7750, color: UIColor.systemGray, action: {
                            self.entryFilter = .All
                            self.switchTabItem(newTabSelection: .Logs)
                        })
                        DashboardCardView(title: "Info", count: 123, color: UIColor.systemOrange, action: {
                            self.entryFilter = .Info
                            self.switchTabItem(newTabSelection: .Logs)
                        })
                    }
                    HStack {
                        DashboardCardView(title: "Errors", count: 12, color: UIColor.systemRed, action: {
                            self.entryFilter = .Errors
                            self.switchTabItem(newTabSelection: .Logs)
                        })
                        DashboardCardView(title: "Logs", count: 3, color: UIColor.systemIndigo, action: {
                            self.switchTabItem(newTabSelection: .Apps)
                        })
                    }.padding(.bottom, 7)
                    ForEach(1...10, id: \.self) {_ in
                        CustomNavigationLink(destination: AnyView(Text("hello darkness"))) {
                            AnyView(LogAppView(logName: "Node.js Playzlib Backend", type: "Error", color: Color(UIColor.systemRed), date: Date(), desc: "SSH Host Authentication Failed for this stupid backend"))
                        }
                    }
                }.listRowInsets(EdgeInsets())
                    .buttonStyle(BorderlessButtonStyle())
                    .pullToRefresh(isShowing: $isLoading) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.isLoading = false
                        }
                }
            }.navigationBarTitle("Dashboard")
                .onAppear {
                    self.setupUI()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func setupUI() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    func switchTabItem(newTabSelection: TabBarSelection) {
        tabBarSelection = newTabSelection
    }
}
