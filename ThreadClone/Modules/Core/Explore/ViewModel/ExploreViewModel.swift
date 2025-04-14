//
//  ExploreViewModel.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

import Combine
import Foundation
@MainActor
class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        AuthService.shared.$userSession
            .receive(on: DispatchQueue.main)
            .sink { [weak self] session in
                self?.loadUsers()
            }
        loadUsers()
    }
    
    private func loadUsers() {
        Task {
            let users = await UserService.shared.fetchUsers()
            self.users = users
        }
    }
}
