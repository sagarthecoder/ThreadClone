//
//  ProfileView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct ProfileView: View {
    
    var profileFilterWidth : CGFloat  {
        let count = CGFloat(max(1, ProfileThreadFilter.allCases.count))
        return UIScreen.main.bounds.width / count - 16
    }
    @State var selectedFilter = ProfileThreadFilter.threads
    @StateObject var viewModel = ProfileViewModel()
    @Namespace var animation
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators : false) {
                VStack(alignment : .leading, spacing : 10) {
                    VStack(alignment : .leading, spacing : 2) {
                        HStack(alignment : .top) {
                            Text(viewModel.user?.fullName ?? "N/A")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            CircularImageView()
                        }
                        
                        Text(viewModel.user?.username ?? "N/A")
                            .font(.footnote)
                    }
                    
                    if let bio = viewModel.user?.bio {
                        Text(bio)
                            .font(.footnote)
                    }
                    
                    Text("2 Followers")
                        .font(.caption)
                        .foregroundStyle(Color(.systemGray3))
                    
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .foregroundStyle(.white)
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, height: 40)
                    .background(Color(.darkText))
                    .cornerRadius(8)
                    
                    HStack {
                        
                        ForEach(ProfileThreadFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(filter == selectedFilter ? .semibold : .regular)
                                if filter == selectedFilter {
                                    Capsule()
                                        .frame(width : profileFilterWidth, height : 1.5)
                                        .foregroundStyle(.black)
                                        .matchedGeometryEffect(id: "underline", in: animation)
                                } else {
                                    Color.clear
                                        .frame(width : profileFilterWidth, height : 1.5)
                                }
                                
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedFilter = filter
                                }
                            }
                        }
                        
                    }
                    .padding(.top, 8)
                    
                    if selectedFilter == .threads {
                        showThreads()
                    }
                }
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        try? await AuthService.shared.logout()
                        UserService.shared.reset()
                    }
                } label: {
                    Text("Logout")
                        .font(.footnote)
                        .foregroundStyle(Color(.red))
                        .fontWeight(.semibold)
                }
                
            }
        }
    }
    
    private func showThreads()-> some View {
        LazyVStack {
            ForEach(0..<100, id : \.self) { thread in
                ThreadCell()
            }
        }
    }
}

#Preview {
    ProfileView()
}
