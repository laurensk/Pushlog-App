//
//  SignUpSheetView.swift
//  Pushlog
//
//  Created by Laurens on 04.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct SignUpSheetView: View {
    
    let update: () -> Void
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    @State private var displayName = ""
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
                
                Text("Start using")
                    .fontWeight(.black)
                    .font(.system(size: 36)).padding(.top, 20)
                
                Text("Pushlog")
                    .fontWeight(.black)
                    .font(.system(size: 36))
                    .foregroundColor(Color("gradient2")).padding(.bottom, 40)
                
                TextField("Your Display Name", text: $displayName)
                    .font(.headline)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(Color("gradient2"), lineWidth: 2))
                    .padding(.bottom)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Button(action: generateToken) {
                    Text("Generate Token")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color("lightBlue")))
                        .padding(.bottom)
                }.padding(.horizontal)
                
                Text("To see your personal token needed for server-side setup, head over to \"More\" in the app later on. You must provide a display name and it can't be longer than 32 characters.")
                    .font(.callout).foregroundColor(Color(UIColor.systemGray)).padding().padding(.top, 10)
            }
        }.alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Error"), message: Text(error), dismissButton: .default(Text("OK")))
        }.padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(.bottom)
        .animation(.easeOut(duration: 0.16))
    }
    
    func generateToken() {
        
        let service = ApiService()
        service.createUser(displayName: "\(displayName)", completion: { user, localError, apiError in
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

struct SignUpSheetView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
