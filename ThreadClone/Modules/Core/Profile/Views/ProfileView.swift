//
//  ProfileView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct ProfileView: View {
   
    @State var selectedFilter = ProfileThreadFilter.threads
    var user : User?
    @StateObject var viewModel = ProfileViewModel()
    init(user : User?) {
        self.user = user
    }
    
    var body: some View {
        ScrollView(showsIndicators : false) {
            VStack(alignment : .leading, spacing : 10) {
                ProfileHeaderView(user : user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .foregroundStyle(.white)
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 40)
                .background(Color(.darkText))
                .cornerRadius(8)
                
                UserContentListView(selectedFilter: $selectedFilter)
                if selectedFilter == .threads {
                    showThreads()
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            if let uid = user?.id {
                viewModel.loadThreads(uid: uid)
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
    let dev = DeveloperPreviewProvider.shared
    ProfileView(user: dev.user)
}
