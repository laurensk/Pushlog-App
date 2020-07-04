//
//  CustomApiSheetView.swift
//  Pushlog
//
//  Created by Laurens on 04.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct CustomApiSheetView: View {
    
    let update: () -> Void
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var newApiUrl = ""
    @State private var showConfirmDialog = false
    @State private var showInvalidUrlDialog = false
    
    
    var body: some View {
        VStack {
            ScrollView {
                
                Image("pushlog_icon_gradient")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, alignment: .center)
                    .accessibility(hidden: true).padding(.top, 50)
                
                Text("Custom API")
                    .fontWeight(.black)
                    .font(.system(size: 36)).padding(.top, 20)
                
                Text("Setup")
                    .fontWeight(.black)
                    .font(.system(size: 36))
                    .foregroundColor(Color("gradient2")).padding(.bottom, 40)
                
                TextField("API Endpoint URL", text: $newApiUrl)
                    .font(.headline)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(Color("gradient2"), lineWidth: 2))
                    .padding(.bottom)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Button(action: setApiEndpoint) {
                    Text("Set Custom API Endpoint")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color("lightBlue")))
                        .padding(.bottom)
                }.padding(.horizontal)
                    .alert(isPresented: $showConfirmDialog) {
                        Alert(title: Text("API Endpoint Updated"), message: Text("The new custom API Endpoint has been set. Please Sign Up or Log In."), dismissButton: .default(Text("OK"), action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }))
                }
                
                Text("If you've already deployed the Pushlog API onto your own server, enter the custom API endpoint URL above. Check GitHub/PushlogApp/pushlogBackend for a tutorial.")
                    .font(.callout).foregroundColor(Color(UIColor.systemGray)).padding().padding(.top, 10)
            }
        }.alert(isPresented: $showInvalidUrlDialog) {
            Alert(title: Text("Error"), message: Text("The URL you've entered is invalid! Please try again."), dismissButton: .default(Text("OK")))
        }
    }
    
    func setApiEndpoint() {
        
        let service = ApiService()
        if let newApiUrl = URL(string: newApiUrl) {
            service.setApiUrl(newApiUrl)
            self.showConfirmDialog.toggle()
        } else {
            self.showInvalidUrlDialog.toggle()
        }
        
    }
}

struct CustomApiSheetView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
