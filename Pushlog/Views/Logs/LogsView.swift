//
//  LogsView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct LogsView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(1...10, id: \.self) {_ in
                        LogListView(logName: "Node.JS Backend Test")
                    }
                }.listRowInsets(EdgeInsets())
                    .buttonStyle(BorderlessButtonStyle())
            }.navigationBarTitle("Logs")
                .navigationViewStyle(StackNavigationViewStyle())
                .onAppear {
                    self.setupUI()
            }
        }
    }
    
    func setupUI() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
    }
    
}

struct LogsView_Previews: PreviewProvider {
    static var previews: some View {
        LogsView()
    }
}
