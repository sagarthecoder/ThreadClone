//
//  User.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

struct User : Identifiable, Codable {
    let id : String
    let email : String
    let username : String
    let fullName : String
    var bio : String?
}
