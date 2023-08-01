//
//  LoginScreen.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 30/07/23.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject var loginVM = LoginViewModel()
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        VStack{
            
            Text("Sign In")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            TextField("Email", text: $loginVM.loginForm.email)
                .modifier(AppTextFieldModifier(leftIconName: "mail"))
                .padding(.bottom, 20)
            
            SecureField("Password", text: $loginVM.loginForm.password)
                .modifier(AppTextFieldModifier(leftIconName: "lock"))
                .padding(.bottom, 30)
                
            
            LoadingButton(title: "Login",
                          isLoading: authVM.isLoading,
                          disable: !loginVM.isFormValid
                          ) {
                
                authVM.callLoginService(loginForm: loginVM.loginForm)
            }
            
            Spacer()
            
        }.padding(.horizontal,20)
            .padding(.vertical,30)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        let authVM = AuthViewModel()
        
        return LoginScreen()
            .environmentObject(authVM)
    }
}
