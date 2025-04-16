//
//  ThreadService.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ThreadService {
    
    static let shared = ThreadService()
    
    func uploadThread(thread : Thread) async throws {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let encodeData = try await Firestore.Encoder().encode(thread)
        try await Firestore.firestore().collection("threads").addDocument(data: encodeData)
    }
    
    func getAllThreads() async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore().collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        let threads = snapshot.documents.compactMap({try? $0.data(as: Thread.self)})
        return threads
    }
    
    func getUserThreads(userId : String) async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore().collection("threads")
            .whereField("ownerId", isEqualTo: userId)
            .order(by: "timestamp", descending: true)
            .getDocuments()
        let threads = snapshot.documents.compactMap({try? $0.data(as: Thread.self)})
        return threads
    }
}
