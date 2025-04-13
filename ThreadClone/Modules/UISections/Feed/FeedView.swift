//
//  FeedView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators : false) {
                LazyVStack {
                    ForEach(0...20, id: \.self) { thread in
                        ThreadCell()
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
