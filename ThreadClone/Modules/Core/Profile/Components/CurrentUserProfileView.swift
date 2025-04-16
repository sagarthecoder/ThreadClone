//
//  CurrentUserProfileView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 14/4/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State var selectedFilter = ProfileThreadFilter.threads
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State var showEditProfileView : Bool = false
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators : false) {
                VStack(alignment : .leading, spacing : 10) {
                    ProfileHeaderView(user: viewModel.user)
                    
                    Button {
                        showEditProfileView.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, height: 40)
                    .background(Color(.white))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray3), lineWidth: 2)
                    }
                    
                    UserContentListView(selectedFilter: $selectedFilter)
                    
                    if selectedFilter == .threads {
                        showThreads()
                    }
                }
            }
            .padding()
            .sheet(isPresented: $showEditProfileView) {
                NavigationStack {
                    EditProfileView()
                        .environmentObject(viewModel)
                }
            }
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
            ForEach(viewModel.threads) { thread in
                ThreadCell(thread: thread)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
