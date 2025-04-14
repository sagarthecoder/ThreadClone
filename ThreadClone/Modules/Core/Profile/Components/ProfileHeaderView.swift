//
//  ProfileHeaderView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user : User?
    var body: some View {
        VStack(alignment : .leading, spacing : 2) {
            HStack(alignment : .top) {
                Text(user?.fullName ?? "N/A")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                CircularImageView()
            }
            
            Text(user?.username ?? "N/A")
                .font(.footnote)
        }
        
        if let bio = user?.bio {
            Text(bio)
                .font(.footnote)
        }
        
        Text("2 Followers")
            .font(.caption)
            .foregroundStyle(Color(.systemGray3))
    }
}

#Preview {
    ProfileHeaderView()
}
