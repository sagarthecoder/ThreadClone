//
//  FeedViewModel.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 15/4/25.
//

import Combine

@MainActor
class FeedViewModel : ObservableObject {
    @Published var threads = [Thread]()
    
    init () {
        fetchThreads()
    }
    
    func fetchThreads() {
        Task {
            do {
                self.threads = try await ThreadService.shared.getAllThreads()
                try await fetchUserDataForThreads()
            } catch {
                print("Error fetching threads: \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchUserDataForThreads() async throws {
        for i in 0..<threads.count {
            let thread = threads[i]
            if let user = try? await UserService.shared.getUser(by: thread.ownerId) {
                threads[i].user = user
            }
        }
    }
}
