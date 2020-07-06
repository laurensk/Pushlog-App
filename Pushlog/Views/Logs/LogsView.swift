//
//  LogsView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh
import SwiftUICustomNavigationLink

struct LogsView: View {
    
    @State private var isLoading = false
    
    @State private var emptyResponse = false
    @State private var logs: [Log] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    if logs.isEmpty && emptyResponse {
                        HStack {
                            Spacer()
                            Text("No Logs..").fontWeight(.semibold).foregroundColor(Color(UIColor.systemGray2))
                            Spacer()
                        }.padding(.top, 50)
                    } else if logs.isEmpty && !emptyResponse {
                        HStack {
                            Spacer()
                            ActivityIndicator(style: .medium)
                            Spacer()
                        }.padding(.top, 50)
                    } else {
                        ForEach(logs, id: \.logToken) { log in
                            CustomNavigationLink(destination: AnyView(Text("hello darkness"))) {
                                AnyView(LogListView(log: log))
                            }
                        }
                    }
                }.listRowInsets(EdgeInsets())
                    .buttonStyle(BorderlessButtonStyle())
                    .pullToRefresh(isShowing: $isLoading) {
                        self.getLogs()
                }
            }.navigationBarTitle("Logs")
                .onAppear {
                    self.setupUI()
            }.onAppear {
                DispatchQueue.main.async {
                    self.getLogs()
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func setupUI() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    func getLogs() {
        let service = ApiService()
        service.getLogs(completion: { logs, localError, apiError in
            if let logs = logs as? [Log] {
                self.isLoading = false
                self.logs = logs
                if logs.isEmpty { self.emptyResponse = true } else { self.emptyResponse = false }
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

struct LogsView_Previews: PreviewProvider {
    static var previews: some View {
        LogsView()
    }
}
