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
    @Published var threads : [Thread] = []
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
                self?.loadThreads()
            }
            .store(in: &cancellables)
    }
    
    func loadThreads() {
        if let uid = user?.id {
            Task {
                do {
                    self.threads = try await ThreadService.shared.getUserThreads(userId: uid)
                    for i in 0..<self.threads.count {
                        self.threads[i].user = user
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
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
