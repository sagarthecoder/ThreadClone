//
//  LoginViewModel.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

import Combine
import Foundation

class LoginViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage : String = ""
    
    func login() {
        Task {
            do {
                try await AuthService.shared.login(email: email, password: password)
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
