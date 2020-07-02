//
//  DashboardView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

public enum DateFilter {
    case Today
    case Last7Days
    case LastMonth
    case LastYear
}

struct DashboardView: View {
    
    @Binding var tabBarSelection: TabBarSelection
    
    @State private var showDateSelector = false
    @State private var dateFilter: DateFilter = .Last7Days
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    VStack {
                        Picker(selection: $dateFilter, label: EmptyView()) {
                            Text("Today").tag(DateFilter.Today)
                            Text("Last 7 Days").tag(DateFilter.Last7Days)
                            Text("Last Month").tag(DateFilter.LastMonth)
                            Text("Last Year").tag(DateFilter.LastYear)
                        }.pickerStyle(SegmentedPickerStyle())
                    }.padding(.top, 5).padding(.bottom, 7)
                    HStack {
                        DashboardCardView(title: "Logs", count: 7750, color: UIColor.systemGray, action: {
                            self.switchTabItem(newTabSelection: .Logs)
                        })
                        DashboardCardView(title: "Warn", count: 123, color: UIColor.systemOrange, action: {
                            self.switchTabItem(newTabSelection: .Logs)
                        })
                    }
                    HStack {
                        DashboardCardView(title: "Errors", count: 12, color: UIColor.systemRed, action: {
                            self.switchTabItem(newTabSelection: .Logs)
                        })
                        DashboardCardView(title: "Apps", count: 3, color: UIColor.systemIndigo, action: {
                            self.switchTabItem(newTabSelection: .Apps)
                        })
                    }.padding(.bottom, 7)
                    ForEach(1...10, id: \.self) {_ in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .shadow(radius: 3)
                                .foregroundColor(Color.white)
                            VStack(alignment: .leading) {
                                Text("Node.js Playzlib Backend").fontWeight(.semibold).font(.system(size: 20)).padding(.bottom, -6)
                                HStack {
                                    RoundedRectangle(cornerRadius: 4).frame(width: 80, height: 25).foregroundColor(Color(UIColor.systemRed)).overlay(Text("Error").foregroundColor(Color.white).fontWeight(.bold))
                                    Text("02.07.2020 15:23").fontWeight(.semibold).foregroundColor(Color(UIColor.systemGray))
                                    Spacer()
                                    Image(systemName: "chevron.right").padding(.trailing, 5).foregroundColor(Color(UIColor.systemGray))
                                }
                                Text("SSH Host Authentication Failed for this stupid backend").lineLimit(1)
                            }.padding()
                        }.padding(.bottom, 5)
                    }
                }.listRowInsets(EdgeInsets()).navigationBarTitle("Dashboard")
                    .buttonStyle(BorderlessButtonStyle())
                    .navigationViewStyle(StackNavigationViewStyle())
                    .onAppear {
                        self.setupUI()
                }
            }
        }
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
