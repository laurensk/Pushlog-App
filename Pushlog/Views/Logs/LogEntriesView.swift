//
//  LogDetailView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI
import SwiftUICustomNavigationLink

struct LogEntriesView: View {
    
    let log: Log
    
    @Binding var dateFilter: DateFilter
    @Binding var entryFilter: EntryFilter
    
    @State private var isLoading = false
    
    @State private var entries: [Entry] = []
    @State private var emptyResponse = false
    
    var filteredEntries: [Entry] {
        switch entryFilter {
        case .All:
            return entries
        case .Info:
            return entries.filter { $0.level.lowercased() == "info" }
        case .Errors:
            return entries.filter { $0.level.lowercased() == "error" }
        }
    }
    
    let service = ApiService()
    
    var body: some View {
        VStack {
            List {
                VStack {
                    Picker(selection: $dateFilter.onChange({ _ in
                        self.getEntries()
                    }), label: EmptyView()) {
                        Text("Today").tag(DateFilter.Today)
                        Text("Last 7 Days").tag(DateFilter.Last7Days)
                        Text("This Month").tag(DateFilter.ThisMonth)
                        Text("This Year").tag(DateFilter.ThisYear)
                    }.onReceive([self.dateFilter].publisher.first()) { _ in
                        //self.getEntries()
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.top, 5)
                    
                    Picker(selection: $entryFilter, label: EmptyView()) {
                        Text("All").tag(EntryFilter.All)
                        Text("Info").tag(EntryFilter.Info)
                        Text("Errors").tag(EntryFilter.Errors)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.top, 5).padding(.bottom, 10)
                }
                
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
                    ForEach(filteredEntries, id: \.self) { entry in
                        CustomNavigationLink(destination: AnyView(EntryDetailView(entry: entry))) {
                            AnyView(EntryTitleView(entry: entry))
                        }
                    }
                }
                
            }.listRowInsets(EdgeInsets())
                .buttonStyle(BorderlessButtonStyle())
                .pullToRefresh(isShowing: $isLoading) {
                    self.getEntries()
            }
        }.navigationBarTitle("\(log.displayName)")
            .onAppear {
                self.setupUI()
                self.getEntries()
        }
    }
    
    func setupUI() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    func getEntries() {
        let timeRange = DateUtils.timeRangeForDateFilter(self.dateFilter)
        service.getLogEntries(logToken: log.logToken, startTime: timeRange.0, endTime: timeRange.1, completion: { entries, localError, apiError in
            if let entries = entries as? [Entry] {
                self.isLoading = false
                self.entries = entries
                if entries.isEmpty { self.emptyResponse = true } else { self.emptyResponse = false }
            } else if apiError != nil {
                self.isLoading = false
                ErrorHandling.errorHandling.throwCustomError(error: apiError!.error, showError: true)
            } else {
                self.isLoading = false
                ErrorHandling.errorHandling.throwError(error: localError!, showError: true)
            }
        })
    }
    
}

struct LogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
