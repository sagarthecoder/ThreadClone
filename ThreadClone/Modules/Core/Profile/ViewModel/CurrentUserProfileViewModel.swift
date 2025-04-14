//
//  ProfileViewModel.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//
import Combine
import Foundation

class CurrentUserProfileViewModel : ObservableObject {
    @Published var user: User?
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        self.fetchUser()
    }
    
    func fetchUser() {
        UserService.shared.$currentUser
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
                self?.user = user
            }
            .store(in: &cancellables)
    }
}
