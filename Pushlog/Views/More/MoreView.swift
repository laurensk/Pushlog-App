//
//  MoreView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    MoreCardView(childView: AnyView(VStack(alignment: .leading) {
                        Text("DisplayName")
                    }.padding().padding(.top, 8).padding(.bottom, 8)))
                    
                    MoreCardView(childView: AnyView(VStack(alignment: .leading) {
                        Text("Show user token")
                        Text("Add token to password manager")
                        Text("Delete account and data")
                        Text("Log out")
                    }.padding().padding(.top, 8).padding(.bottom, 8)))
                    
                    MoreCardView(childView: AnyView(VStack(alignment: .leading) {
                        Text("Tutorial for Node.JS")
                        Text("Tutorial for Java")
                        Text("Tutorial for PHP")
                        Text("Tutorial for Python")
                    }.padding().padding(.top, 8).padding(.bottom, 8)))
                    
                    MoreCardView(childView: AnyView(VStack(alignment: .leading) {
                        Text("Developers")
                        Text("Contact")
                        Text("Twitter")
                        Text("GitHub")
                        Text("Privacy Policy")
                    }.padding().padding(.top, 8).padding(.bottom, 8)))
                }
                
            }.navigationBarTitle("More")
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
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
