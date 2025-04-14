//
//  RootViewModel.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

import FirebaseAuth
import Combine

class RootViewModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchUserSession()
    }
    
    func fetchUserSession() {
        AuthService.shared.$userSession
            .receive(on: DispatchQueue.main)
            .sink { [weak self] session in
                guard let self = self else { return }
                self.userSession = session
            }
            .store(in: &cancellables)
    }
}
