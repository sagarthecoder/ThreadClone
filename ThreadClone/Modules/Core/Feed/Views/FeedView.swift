//
//  FeedView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators : false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        NavigationLink {
                            ProfileView(user: thread.user)
                        } label: {
                            ThreadCell(thread: thread)
                        }
                    }
                }
            }
            .refreshable {
                print("Refresh : Debug Mode = \(Date())")
                viewModel.fetchThreads()
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.fetchThreads()
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundStyle(.black)
                }

            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
