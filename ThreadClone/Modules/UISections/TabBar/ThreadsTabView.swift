//
//  ThreadsTabView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab : Int = 0
    var body: some View {
        TabView(selection : $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .tag(0)
                .onAppear {
                    selectedTab = 0
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
                .onAppear {
                    selectedTab = 1
                }
            Text("Plus")
                .tabItem {
                    Image(systemName: "plus")
                }
                .tag(2)
                .onAppear {
                    selectedTab = 2
                }
            Text("Heart")
                .tabItem {
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .tag(3)
                .onAppear {
                    selectedTab = 3
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .tag(4)
                .onAppear {
                    selectedTab = 4
                }
        }
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
