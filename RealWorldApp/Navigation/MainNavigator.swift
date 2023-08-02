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
        
        ZStack{
            if authVM.authUser == nil {
                UnAuthorizedNavigator()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge:.leading))
                
            } else {
                AuthorizedNavigator()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .transition(.move(edge: .leading))
            }
        }.onAppear {
            authVM.tryToRetrieveSavedUser()
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
