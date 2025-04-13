//
//  RootView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//
import SwiftUI

struct RootView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            ThreadsTabView()
        } else {
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

#Preview {
    RootView()
}
