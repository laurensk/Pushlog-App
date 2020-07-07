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
    
    @State private var entries: [GlobalEntry] = []
    @State private var emptyResponse = false
    
    @State private var entriesCount: String = "—"
    @State private var errorCount: String = "—"
    @State private var infoCount: String = "—"
    @State private var logCount: String = "—"
    
    let service = ApiService()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    VStack {
                        Picker(selection: $dateFilter.onChange({ _ in
                            self.getAllEntries()
                            self.updateLogsCount()
                        }), label: EmptyView()) {
                            Text("Today").tag(DateFilter.Today)
                            Text("Last 7 Days").tag(DateFilter.Last7Days)
                            Text("This Month").tag(DateFilter.ThisMonth)
                            Text("This Year").tag(DateFilter.ThisYear)
                        }.pickerStyle(SegmentedPickerStyle())
                    }.padding(.top, 5).padding(.bottom, 7)
                    HStack {
                        
                        DashboardCardView(title: "Entries", count: "\(entriesCount)", color: UIColor.systemGray, action: {
                            self.entryFilter = .All
                            self.switchTabItem(newTabSelection: .Logs)
                        })
                        
                        DashboardCardView(title: "Info", count: "\(infoCount)", color: UIColor.systemOrange, action: {
                            self.entryFilter = .Info
                            self.switchTabItem(newTabSelection: .Logs)
                        })
                    }
                    HStack {
                        DashboardCardView(title: "Errors", count: "\(errorCount)", color: UIColor.systemRed, action: {
                            self.entryFilter = .Errors
                            self.switchTabItem(newTabSelection: .Logs)
                        })
                        DashboardCardView(title: "Logs", count: "\(logCount)", color: UIColor.systemIndigo, action: {
                            self.switchTabItem(newTabSelection: .Apps)
                        })
                    }.padding(.bottom, 7)
                    
                    
                    if entries.isEmpty && emptyResponse {
                        HStack {
                            Spacer()
                            Text("No Entries...").fontWeight(.semibold).foregroundColor(Color(UIColor.systemGray2))
                            Spacer()
                        }.padding(.top, 50)
                    } else if entries.isEmpty && !emptyResponse {
                        HStack {
                            Spacer()
                            ActivityIndicator(style: .medium)
                            Spacer()
                        }.padding(.top, 50)
                    } else {
                        ForEach(entries, id: \.self) { globalEntry in
                            CustomNavigationLink(destination: AnyView(EntryDetailView(entry: globalEntry.entry, log: globalEntry.log))) {
                                AnyView(EntryAppView(log: globalEntry.log, entry: globalEntry.entry))
                            }
                        }
                    }
                }.listRowInsets(EdgeInsets())
                    .buttonStyle(BorderlessButtonStyle())
                    .pullToRefresh(isShowing: $isLoading) {
                        self.getAllEntries()
                        self.updateLogsCount()
                }
            }.navigationBarTitle("Dashboard")
                .onAppear {
                    self.setupUI()
                    self.getAllEntries()
                    self.updateLogsCount()
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
    
    func getAllEntries() {
        let timeRange = DateUtils.timeRangeForDateFilter(self.dateFilter)
        service.getAllEntries(startTime: timeRange.0, endTime: timeRange.1, completion: { entries, localError, apiError in
            if let entries = entries as? [GlobalEntry] {
                self.isLoading = false
                
                self.entries = entries.filter { $0.entry.level.lowercased() == "error" }
                
                if entries.isEmpty { self.emptyResponse = true } else { self.emptyResponse = false }
                
                self.entriesCount = "\(entries.count)"
                self.errorCount = "\(entries.filter { $0.entry.level.lowercased() == "error" }.count)"
                self.infoCount = "\(entries.filter { $0.entry.level.lowercased() == "info" }.count)"
                
            } else if apiError != nil {
                self.isLoading = false
                ErrorHandling.errorHandling.throwCustomError(error: apiError!.error, showError: true)
            } else {
                self.isLoading = false
                ErrorHandling.errorHandling.throwError(error: localError!, showError: true)
            }
        })
    }
    
    func updateLogsCount() {
        service.getLogs(completion: { logs, localError, apiError in
            if let logs = logs as? [Log] {
                self.logCount = "\(logs.count)"
            } else if apiError != nil {
                ErrorHandling.errorHandling.throwCustomError(error: apiError!.error, showError: true)
            } else {
                ErrorHandling.errorHandling.throwError(error: localError!, showError: true)
            }
        })
    }
}
