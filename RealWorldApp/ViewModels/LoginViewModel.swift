//
//  LoginViewModel.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 30/07/23.
//

import Foundation

class LoginViewModel : ObservableObject {
    
    @Published var loginForm = LoginForm(email: "", password: "")

    
    var isFormValid: Bool {
        !loginForm.password.isEmpty
        && !loginForm.email.isEmpty
    }
    
    
    
}
