//
//  ProfileViewModel.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//
import Combine
import Foundation
import SwiftUI
import PhotosUI

@MainActor
class CurrentUserProfileViewModel : ObservableObject {
    @Published var user: User?
    var cancellables: Set<AnyCancellable> = []
    @Published var profileImage : Image?
    @Published var selectedItem : PhotosPickerItem? {
        didSet {
            loadImage()
        }
    }
    
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
    
    private func loadImage() {
        guard let selectedItem = self.selectedItem else { return }
        
        Task {
            guard let data = try? await selectedItem.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) else {
                return
            }
            self.profileImage = Image(uiImage: uiImage)
        }
    }
}
