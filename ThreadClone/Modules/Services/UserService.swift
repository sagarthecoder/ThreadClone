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
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
        Task {
            do {
                guard let uid = Auth.auth().currentUser?.uid else {
                    return
                }
                let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
                let user = try snapshot.data(as: User.self)
                self.currentUser = user
                print("Fetched User : = \(user.id)")
            } catch let error {
                print("Error : Fetching current user = \(error.localizedDescription)")
            }
        }
    }
    
    @MainActor
    func reset() {
        self.currentUser = nil
    }
    
    func fetchUsers() async -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return []
        }
        do {
            let snapshot = try await Firestore.firestore().collection("users").getDocuments()
            let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
            return users.filter({$0.id != currentUid})
        } catch {
            return []
        }
    }
    
    func getUser(by uid : String) async throws -> User {
        let snapshot = try await Firestore
            .firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        return user
    }
}
