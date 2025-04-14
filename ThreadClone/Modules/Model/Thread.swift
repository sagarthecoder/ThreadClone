//
//  Thread.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//
import FirebaseFirestore
import Firebase
import Foundation

struct Thread : Identifiable, Codable {
    @DocumentID var threadID : String?
    let caption : String
    let timestamp : Timestamp
    let ownerId : String
    var likes : Int
    var user : User?
    var id : String {
        return threadID ?? NSUUID().uuidString
    }
}
