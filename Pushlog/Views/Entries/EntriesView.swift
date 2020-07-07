//
//  EntriesView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI
import SwiftUICustomNavigationLink

struct EntriesView: View {
    
    @Binding var dateFilter: DateFilter
    @Binding var entryFilter: EntryFilter
    
    @State private var isLoading = false
    
    @State private var entries: [GlobalEntry] = []
    @State private var emptyResponse = false
    
    var filteredEntries: [GlobalEntry] {
        switch entryFilter {
        case .All:
            return entries
        case .Info:
            return entries.filter { $0.entry.level.lowercased() == "info" }
        case .Errors:
            return entries.filter { $0.entry.level.lowercased() == "error" }
        }
    }
    
    let service = ApiService()
    
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
                        ForEach(filteredEntries, id: \.self) { globalEntry in
                            CustomNavigationLink(destination: AnyView(EntryDetailView(entry: globalEntry.entry, log: globalEntry.log))) {
                                AnyView(EntryTitleView(entry: globalEntry.entry))
                            }
                        }
                    }
                    
                }.listRowInsets(EdgeInsets())
                    .buttonStyle(BorderlessButtonStyle())
                    .pullToRefresh(isShowing: $isLoading) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.isLoading = false
                        }
                }
            }.navigationBarTitle("Entries")
                .onAppear {
                    self.setupUI()
                    self.getAllEntries()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func setupUI() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    func getAllEntries() {
        let timeRange = DateUtils.timeRangeForDateFilter(self.dateFilter)
        service.getAllEntries(startTime: timeRange.0, endTime: timeRange.1, completion: { entries, localError, apiError in
            if let entries = entries as? [GlobalEntry] {
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
