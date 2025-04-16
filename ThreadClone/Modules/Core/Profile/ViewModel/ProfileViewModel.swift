//
//  ProfileViewModel.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 17/4/25.
//
import Combine
import Foundation

@MainActor
class ProfileViewModel : ObservableObject {
    @Published var threads : [Thread] = []
    
    func loadThreads(uid : String){
        Task {
            do {
                self.threads = try await ThreadService.shared.getUserThreads(userId: uid)
            } catch let error {
                print("debug : Error fetching user's threads : \(error.localizedDescription)")
            }
        }
    }
}
