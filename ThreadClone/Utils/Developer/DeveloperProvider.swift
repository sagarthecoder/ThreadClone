//
//  DeveloperProvider.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

import SwiftUI

class DeveloperPreviewProvider {
    static let shared = DeveloperPreviewProvider()
    let user = User(id: "uuid1234", email: "check@gmail.com", username: "checking12", fullName: "Check My Name")
}

extension PreviewProvider {
    static var dev : DeveloperPreviewProvider {
        return DeveloperPreviewProvider.shared
    }
}
