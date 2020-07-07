//
//  MoreUserTokenView.swift
//  Pushlog
//
//  Created by Laurens on 07.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct MoreUserTokenView: View {
    
    let appUser: AppUser
    
    var body: some View {
        Text("\(appUser.userToken)")
    }
}

struct MoreUserTokenView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
