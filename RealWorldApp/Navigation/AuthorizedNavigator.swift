//
//  AuthorizedNavigator.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 2/08/23.
//

import SwiftUI

struct AuthorizedNavigator: View {
    var body: some View {
        TabView{
            
            HomeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            UserProfileScreen()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct AuthorizedNavigator_Previews: PreviewProvider {
    static var previews: some View {
        return AuthorizedNavigator().environmentObject(MockData.getAuthVM())
    }
}
