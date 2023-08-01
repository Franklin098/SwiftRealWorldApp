//
//  MainNavigator.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 31/07/23.
//

import SwiftUI

struct MainNavigator: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        if authVM.authUser == nil {
            UnAuthorizedNavigator()
                .environmentObject(authVM)
        } else {
            UserProfileScreen()
                .environmentObject(authVM)
        }
    }
}

struct MainNavigator_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let authVM = AuthViewModel()
        authVM.authUser = User(email: "test@test.com", token: "ffff", username: "Test Name", bio: "Lorem Impusium", image: "")
        
        return MainNavigator().environmentObject(authVM)
    }
}
