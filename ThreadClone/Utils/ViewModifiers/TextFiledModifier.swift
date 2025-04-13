//
//  TextFiledModifier.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct TextFiledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 10)
    }
}
