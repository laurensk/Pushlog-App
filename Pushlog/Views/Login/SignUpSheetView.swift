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
    
    @State private var displayName = ""
    @State private var token = ""
    
    @State private var showErrorAlert = false
    
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
            Alert(title: Text("Error"), message: Text(PushlogError.NetworkError.rawValue), dismissButton: .default(Text("OK")))
        }
    }
    
    func generateToken() {
        
        let service = ApiService()
        service.createUser(displayName: "\(displayName)", completion: { user, error in
            if error == nil {
                if let user = user as? User {
                    UserPersistence.setUser(loggedIn: true, userToken: user.userToken, userDisplayName: user.displayName)
                    self.update()
                }
            } else {
                ErrorHandling.errorHandling.throwError(error: error!, showError: false)
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
