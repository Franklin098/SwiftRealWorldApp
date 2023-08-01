//
//  UserAccount.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 30/07/23.
//

import Foundation

struct LoginForm: Encodable {
    
    var email: String
    var password: String
}

struct LoginRequest: Encodable {
    let user: LoginForm
}


struct User: Decodable {
    let email: String
    let token: String
    let username: String
    let bio: String?
    let image: String?
}

struct LoginResponse: Decodable {
    let user: User
}
