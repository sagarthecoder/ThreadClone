//
//  CreateThreadViewModel.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

import Foundation
import FirebaseCore

class CreateThreadViewModel : ObservableObject {
    func uploadThread(caption : String) async throws {
        guard let user = UserService.shared.currentUser else {
            return
        }
        let thread = Thread(caption: caption, timestamp: Timestamp(), ownerId: user.id, likes: 0)
        try await ThreadService.shared.uploadThread(thread: thread)
    }
}
