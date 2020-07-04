//
//  LoginSheetView.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct LoginSheetView: View {
    
    let update: () -> Void
    
    @State private var token = ""
    
    @State private var showErrorAlert = false
    @State private var error = ""
    
    var body: some View {
        VStack {
            ScrollView {
                
                Image("pushlog_icon_gradient")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)
                .accessibility(hidden: true).padding(.top, 50)
                
                Text("Welcome back")
                    .fontWeight(.black)
                    .font(.system(size: 36)).padding(.top, 20)
                
                Text("to Pushlog")
                    .fontWeight(.black)
                    .font(.system(size: 36))
                    .foregroundColor(Color("gradient2")).padding(.bottom, 40)
                
                TextField("Your Token", text: $token)
                    .font(.headline)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(Color("gradient2"), lineWidth: 2))
                    .padding(.bottom)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Button(action: login) {
                    Text("Log in")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color("lightBlue")))
                        .padding(.bottom)
                }.padding(.horizontal)
                
                Text("Paste your token in the text field above in order to authenticate. If you dont't have a token or want to start new, sign up instead.").font(.callout).foregroundColor(Color(UIColor.systemGray)).padding().padding(.top, 10)
            }
        }.alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Error"), message: Text(error), dismissButton: .default(Text("OK")))
        }
    }
    
    func login() {
        
        let service = ApiService()
        service.loginUser(token: "\(token)", completion: { user, localError, apiError in
            if localError == nil && apiError == nil {
                if let user = user as? User {
                    UserPersistence.setUser(loggedIn: true, userToken: user.userToken, userDisplayName: user.displayName)
                    self.update()
                }
            } else if apiError != nil {
                ErrorHandling.errorHandling.throwCustomError(error: apiError!.error, showError: false)
                self.error = apiError!.error
                self.showErrorAlert.toggle()
            } else {
                ErrorHandling.errorHandling.throwError(error: localError!, showError: false)
                self.error = localError!.rawValue
                self.showErrorAlert.toggle()
            }
        })
        
    }
}

struct LoginSheetView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
