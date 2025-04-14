//
//  ExploreView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct ExploreView: View {
    @State var searchText : String = ""
    @StateObject private var viewModel = ExploreViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.users) { user in
                            UserCell(user: user)
                                .padding(.vertical, 10)
                            Divider()
                        }
                    }
                    .padding()
                }
                .searchable(text: $searchText, prompt: "Search")
            }
        }
        .navigationTitle("Search")
    }
}

#Preview {
    NavigationStack {
        ExploreView()
    }
}
