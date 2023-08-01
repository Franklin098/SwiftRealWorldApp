//
//  UserProfileScreen.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 31/07/23.
//

import SwiftUI

struct UserProfileScreen: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        VStack{
            Text("You are Logged In")
                .padding(.bottom, 50)
            Text("User:")
                .padding(.bottom, 50)
            Text(authVM.authUser?.username ?? "")
            Text(authVM.authUser?.email ?? "")
        }
        
    }
}

struct UserProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        let authVM = AuthViewModel()
        authVM.authUser = User(email: "test@test.com", token: "ffff", username: "Test Name", bio: "Lorem Impusium", image: "")
        
        return UserProfileScreen()
            .environmentObject(authVM)
    }
}
