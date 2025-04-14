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
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    private func showThreads()-> some View {
        LazyVStack {
            ForEach(0..<100, id : \.self) { _ in
                ThreadCell(thread: DeveloperPreviewProvider.shared.thread)
            }
        }
    }
}

#Preview {
    let dev = DeveloperPreviewProvider.shared
    ProfileView(user: dev.user)
}
