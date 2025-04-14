//
//  ThreadCloneApp.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 12/4/25.
//

import SwiftUI

@main
struct ThreadCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
