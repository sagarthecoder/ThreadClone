//
//  AuthService.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    static let shared = AuthService()
    @Published var userSession : FirebaseAuth.User?
    
    init () {
        self.userSession = Auth.auth().currentUser
    }
    
    func signup(email: String, password: String, fullName : String, username : String) async throws {
        let session = try await Auth.auth().createUser(withEmail: email, password: password)
        userSession = Auth.auth().currentUser
        UserService.shared.fetchCurrentUser()
        try await uploadUserData(id: session.user.uid, email: email, fullName: fullName, username: username)
        
    }
    
    func login(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
        userSession = Auth.auth().currentUser
        UserService.shared.fetchCurrentUser()
    }
    
    func logout() async throws {
        try Auth.auth().signOut()
        userSession = nil
        await UserService.shared.reset()
    }
    
    func uploadUserData(id : String, email: String, fullName : String, username : String) async throws {
        let user = User(id: id, email: email, username: username, fullName: fullName)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
    }
}
