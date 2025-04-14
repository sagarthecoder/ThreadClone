//
//  DeveloperProvider.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

import SwiftUI
import Firebase

class DeveloperPreviewProvider {
    static let shared = DeveloperPreviewProvider()
    let user = User(id: "uuid1234", email: "check@gmail.com", username: "checking12", fullName: "Check My Name")
    let thread = Thread(caption: "This is test thread", timestamp: Timestamp(), ownerId: "123", likes: 0)
}

extension PreviewProvider {
    static var dev : DeveloperPreviewProvider {
        return DeveloperPreviewProvider.shared
    }
}
