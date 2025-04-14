//
//  AuthService.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//
import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    
    func signup(email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
}
