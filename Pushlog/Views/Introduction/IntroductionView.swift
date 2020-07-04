//
//  IntroductionView.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct IntroductionView: View {
    
    let update: () -> Void
    
    @State private var sheetActive = false
    @State private var sheetSelected: Sheets = .loginSheet
    
    var body: some View {
        VStack(alignment: .center) {
            
            Spacer()
            
            IntroHeaderView()
            
            IntroFeatureViews()
            
            Spacer(minLength: 40)
            
            IntroSingleBtnView(action: signUp)
            
            IntroBtnRowView(actionLeft: customAPI, actionRight: login)
            
        }.sheet(isPresented: $sheetActive, content: sheetContent)
    }
    
    func signUp() {
        self.sheetSelected = .signUpSheet
        self.sheetActive.toggle()
    }
    
    func customAPI() {
        self.sheetSelected = .customApiSheet
        self.sheetActive.toggle()
    }
    
    func login() {
        self.sheetSelected = .loginSheet
        self.sheetActive.toggle()
    }
}

extension IntroductionView {
    enum Sheets {
        case loginSheet, signUpSheet, customApiSheet
    }
    
    @ViewBuilder func sheetContent() -> some View {
        if sheetSelected == .loginSheet {
            LoginSheetView(update: self.update)
        } else if sheetSelected == .signUpSheet {
            SignUpSheetView(update: self.update)
        } else {
            CustomApiSheetView(update: self.update)
        }
    }
}
