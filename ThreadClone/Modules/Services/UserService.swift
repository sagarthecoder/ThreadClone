//
//  UserService.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

import FirebaseFirestore
import Foundation
import FirebaseAuth

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task {
            do {
                try await fetchCurrentUser()
            } catch {
                print("Error : Fetching current user = \(error.localizedDescription)")
            }
        }
    }
    
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("Fetched User : = \(user.id)")
    }
}
