//
//  ExploreView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct ExploreView: View {
    @State var searchText : String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(0..<20, id: \.self) { _ in
                            UserCell()
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
