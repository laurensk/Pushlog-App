//
//  MoreView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct MoreView: View {
    
    let update: () -> Void
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var appUser = UserPersistence.getUser()
    
    @State private var showUserTokenSheet = false
    
    let safariView = SafariView()
    
    var body: some View {
        NavigationView {
            VStack {
                UniversalList {
                    MoreCardView(childView: AnyView(VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                            Text("Name")
                                .fontWeight(.semibold)
                                .padding(.leading, 5)
                            Spacer()
                            Text(appUser.userDisplayName)
                        }.padding(.horizontal)
                    }.padding().padding(.top, 8).padding(.bottom, 8)))
                    
                    MoreCardView(childView: AnyView(VStack(alignment: .leading) {
                        VStack {
                            Button(action: {
                                self.showUserTokenSheet.toggle()
                            }) {
                                HStack {
                                    Image(systemName: "lock.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Text("Show user token")
                                        .fontWeight(.semibold)
                                        .padding(.leading, 5)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Spacer()
                                    Image(systemName: "chevron.right").padding(.trailing, 5).foregroundColor(Color(UIColor.systemGray))
                                }.padding(.horizontal).padding(.bottom)
                            }
                            
                            Button(action: {
                                MoreActions.sendMail()
                            }) {
                                HStack {
                                    Image(systemName: "trash.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Text("Delete account and data")
                                        .fontWeight(.semibold)
                                        .padding(.leading, 5)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Spacer()
                                    Image(systemName: "chevron.right").padding(.trailing, 5).foregroundColor(Color(UIColor.systemGray))
                                }.padding(.horizontal).padding(.bottom)
                            }
                            Button(action: {
                                MoreActions.logOut(update: self.update)
                            }) {
                                HStack {
                                    Image(systemName: "arrow.down.left.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Text("Log out")
                                        .fontWeight(.semibold)
                                        .padding(.leading, 5)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Spacer()
                                    Image(systemName: "chevron.right").padding(.trailing, 5).foregroundColor(Color(UIColor.systemGray))
                                }.padding(.horizontal)
                            }
                            
                        }
                    }.padding().padding(.top, 8).padding(.bottom, 8)))
                    
                    MoreCardView(childView: AnyView(VStack(alignment: .leading) {
                        VStack {
                            HStack {
                                Image(systemName: "book.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                Text("Tutorials")
                                    .fontWeight(.semibold)
                                    .padding(.leading, 5)
                                Spacer()
                            }.padding(.horizontal).padding(.bottom, 5)
                            HStack {
                                MoreTutorialView(text: "Node.JS", action: {
                                    self.safariView.openURL(url: "https://www.github.com/pushlogapp")
                                })
                                MoreTutorialView(text: "Java", action: {
                                    self.safariView.openURL(url: "https://www.github.com/pushlogapp")
                                })
                            }
                            HStack {
                                MoreTutorialView(text: "PHP", action: {
                                    self.safariView.openURL(url: "https://www.github.com/pushlogapp")
                                })
                                MoreTutorialView(text: "Python", action: {
                                    self.safariView.openURL(url: "https://www.github.com/pushlogapp")
                                })
                            }
                        }
                    }.padding().padding(.top, 8).padding(.bottom, 8)))
                    
                    MoreCardView(childView: AnyView(VStack(alignment: .leading) {
                        VStack {
                            Button(action: {
                                MoreActions.openURL(url: "https://twitter.com/laurensk")
                            }) {
                                HStack {
                                    Image(systemName: "person.2.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Text("Developers")
                                        .fontWeight(.semibold)
                                        .padding(.leading, 5)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Spacer()
                                    Text("Gebes & Laurens")
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                }.padding(.horizontal).padding(.bottom)
                            }
                            Button(action: {
                                MoreActions.sendMail()
                            }) {
                                HStack {
                                    Image(systemName: "envelope")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Text("Contact")
                                        .fontWeight(.semibold)
                                        .padding(.leading, 5)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Spacer()
                                    Text("pushlog@laurensk.at")
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                }.padding(.horizontal).padding(.bottom)
                            }
                            Button(action: {
                                MoreActions.openURL(url: "https://twitter.com/PushlogApp")
                            }) {
                                HStack {
                                    Image(systemName: "pencil.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Text("Twitter")
                                        .fontWeight(.semibold)
                                        .padding(.leading, 5)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Spacer()
                                    Text("@PushlogApp")
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                }.padding(.horizontal).padding(.bottom)
                            }
                            Button(action: {
                                MoreActions.openURL(url: "https://github.com/pushlogapp")
                            }) {
                                HStack {
                                    Image(systemName: "chevron.left.slash.chevron.right")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Text("GitHub")
                                        .fontWeight(.semibold)
                                        .padding(.leading, 5)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Spacer()
                                    Text("/PushlogApp")
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                }.padding(.horizontal).padding(.bottom)
                            }
                            Button(action: {
                                self.safariView.openURL(url: "https://www.mysup.at/datenschutzerklaerung/")
                            }) {
                                HStack {
                                    Image(systemName: "lock.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Text("Privacy Policy")
                                        .fontWeight(.semibold)
                                        .padding(.leading, 5)
                                        .foregroundColor(Color(colorScheme == .dark ? UIColor.white : UIColor.darkText))
                                    Spacer()
                                    Image(systemName: "chevron.right").padding(.trailing, 5).foregroundColor(Color(UIColor.systemGray))
                                }.padding(.horizontal)
                            }
                        }
                    }.padding().padding(.top, 8).padding(.bottom, 8)))
                }.buttonStyle(BorderlessButtonStyle())
            }.navigationBarTitle("Pushlog")
            .onAppear {
                self.setupUI()
            }.sheet(isPresented: $showUserTokenSheet) {
                TokenSheetView(token: self.appUser.userToken)
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
        EmptyView()
    }
}
