//
//  UnAuthorizedNavigator.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 30/07/23.
//

import SwiftUI

enum UnAuthScreens {
    case signUp
    case login
}

struct UnAuthorizedNavigator: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack (path: $path){
            
            VStack {
                
                
                Text("Conduit")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("The Real World App")
                    .padding(.top,30)
                    .font(.title2)
                
                Spacer()
            
                LoadingButton(title: "Login") {
                    path.append(UnAuthScreens.login)
                }
                .padding(.bottom, 10)
                                    
                LoadingButton(title: "Sign Up") {
                    path.append(UnAuthScreens.signUp)
                }.padding(.bottom, 30)
                

                
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 30)
            .navigationDestination(for: UnAuthScreens.self) { value in
                switch value {
                case .signUp:
                    SignUpScreen()
                case .login:
                    LoginScreen()
                }
            }
            
        }
    }
}

struct UnAuthorizedNavigator_Previews: PreviewProvider {
    static var previews: some View {
        UnAuthorizedNavigator()
    }
}
