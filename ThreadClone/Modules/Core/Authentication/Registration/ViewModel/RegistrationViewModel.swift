//
//  RegistrationViewModel.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//
import FirebaseAuth

class RegistrationViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var username: String = ""
    @Published var fullName: String = ""
    @Published var errorMessage : String = ""
    
    @MainActor
    func createNewUser() {
        Task {
            do {
                try await AuthService.shared.signup(email: email, password: password)
                print("Debug : Created New User = \(Auth.auth().currentUser?.uid ?? "N/A")")
                
            } catch let error {
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
