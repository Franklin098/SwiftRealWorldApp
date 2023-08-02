//
//  MockData.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 2/08/23.
//

import Foundation


class MockData {
   
    static func getAuthVM() -> AuthViewModel {
        let authVM = AuthViewModel()
        authVM.authUser = User(email: "test@test.com", token: "ffff", username: "Test Name", bio: "Lorem Impusium", image: "")
        return authVM
    }
}
