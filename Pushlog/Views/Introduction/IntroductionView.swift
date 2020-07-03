//
//  IntroductionView.swift
//  Pushlog
//
//  Created by Laurens on 03.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct IntroductionView: View {
    var body: some View {
        VStack(alignment: .center) {
            
            Spacer()

            IntroHeaderView()
            
            IntroFeatureViews()
            
            Spacer(minLength: 40)
            
            IntroSingleBtnView(action: signUp)
            
            IntroBtnRowView(actionLeft: customAPI, actionRight: login)
            
        }
    }
    
    func signUp() {
        
    }
    
    func customAPI() {
        
    }
    
    func login() {
        
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
