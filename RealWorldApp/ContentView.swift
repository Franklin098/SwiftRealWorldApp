//
//  ContentView.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 30/07/23.
//

import SwiftUI

struct ContentView: View {
    
    var authVM = AuthViewModel()
    
    var body: some View {
        MainNavigator()
            .environmentObject(authVM)
    }
        
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
