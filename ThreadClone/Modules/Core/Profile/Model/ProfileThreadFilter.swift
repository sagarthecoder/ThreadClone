//
//  ProfileThreadFilter.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

enum ProfileThreadFilter : Int, CaseIterable, Identifiable {
    case threads
    case replies
    case followers
    
    var title : String {
        switch self {
        case .threads:
            return "Threads"
        case .replies:
            return "Replies"
        case .followers:
            return "Followers"
        }
    }
    
    var id : Int {
        return rawValue
    }
}
