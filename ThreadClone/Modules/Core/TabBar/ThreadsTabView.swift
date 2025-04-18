//
//  ThreadsTabView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab : Int = 0
    @State private var isShowCreateThread : Bool = false
    @State private var previousTab = 0
    
    var currentUser : User? {
        return UserService.shared.currentUser
    }
    var body: some View {
        TabView(selection : $selectedTab) {
            NavigationStack {
                FeedView()
            }
            .tabItem {
                Image(systemName: "house")
                    .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
            }
            .tag(0)
            .onAppear {
                
            }
            NavigationStack {
                ExploreView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
            }
            .tag(1)
            .onAppear {
                
            }
            Color.clear
                .tabItem {
                    Image(systemName: "plus")
                }
                .tag(2)
                .onAppear {
                    selectedTab = previousTab
                }
            Text("Heart")
                .tabItem {
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .tag(3)
                .onAppear {
                    
                }
            NavigationStack {
                CurrentUserProfileView()
            }
            .tabItem {
                Image(systemName: "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .tag(4)
                .onAppear {
                    
                }
        }
        .tint(.black)
        .onChange(of: selectedTab, { oldValue, newValue in
            if newValue == 2 {
                isShowCreateThread = true
                previousTab = oldValue
            }
        })
        .sheet(isPresented: $isShowCreateThread, onDismiss: {
            selectedTab = previousTab
        }) {
            CreateThreadView(user : currentUser)
        }
    }
}

#Preview {
    ThreadsTabView()
}
