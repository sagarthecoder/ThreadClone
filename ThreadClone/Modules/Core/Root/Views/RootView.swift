//
//  RootView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//
import SwiftUI

struct RootView: View {
    @State private var isLoggedIn = false
    @StateObject private var viewModel = RootViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    RootView()
}
