//
//  CircularImageView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct CircularImageView: View {
    @State var imageName : String = "messi"
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 30, height: 30)
            .clipShape(.circle)
    }
}

#Preview {
    CircularImageView()
}
