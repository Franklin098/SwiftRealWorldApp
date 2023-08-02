//
//  AuthGlobalState.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 31/07/23.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var authUser: User?
    
    // key-value storage, automatically looks for a value and populates the variable
    @AppStorage("userData") private var userData: Data?
    
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
                        
                        let data = try? JSONEncoder().encode(loginResponse.user)
                        self.userData = data
                        
                        withAnimation {
                            self.authUser = loginResponse.user
                        }
                        
                    case .failure(let error):
                        print("Login ERROR, errorType: \(error)")
                    }
                    
                }
            
        }
    
    }
    
    func tryToRetrieveSavedUser(){
        
        guard let data = self.userData else {
            return
        }
        
        do{
            
            let user = try JSONDecoder().decode(User.self, from: data)
            self.authUser = user

        } catch {
            print("Could not retrieve logged user")
        }
        
    }
    
    func logOut() {
        
        withAnimation {
            self.authUser = nil
            self.userData = nil
        }
        
    }
    
    
}
