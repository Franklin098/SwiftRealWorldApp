//
//  UserAccount.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 30/07/23.
//

import Foundation

struct LoginForm: Codable {
    
    var email: String
    var password: String
}

struct LoginRequest: Codable {
    let user: LoginForm
}


struct User: Codable {
    let email: String
    let token: String
    let username: String
    let bio: String?
    let image: String?
}

struct LoginResponse: Codable {
    let user: User
}
