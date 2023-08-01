//
//  AuthGlobalState.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 31/07/23.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var authUser: User?
    @Published var isLoading: Bool = false
    
    
    func callLoginService(loginForm: LoginForm){
        self.isLoading = true
        
        let loginRequest = LoginRequest(user: loginForm)
        
        ConduitService.shared
            .postRequest(requestBody: loginRequest,
                         forResponseType: LoginResponse.self,
                         endpointUrl: ConduitService.loginEndpoint) { result in
                
                DispatchQueue.main.async {
                       
                    self.isLoading = false
                    
                    switch result {
                        
                    case .success(let loginResponse):
                        print("Login Success")
                        self.authUser = loginResponse.user
                        
                    case .failure(let error):
                        print("Login ERROR, errorType: \(error)")
                    }
                    
                }
            
        }
    
    }
    
    
}
