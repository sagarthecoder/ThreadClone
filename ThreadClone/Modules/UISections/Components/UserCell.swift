//
//  UserCell.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularImageView(imageName: "messi")
            
            VStack(alignment: .leading) {
                Text("messiTheCoder")
                    .font(.footnote)
                    .fontWeight(.bold)
                Text("Lionell Andrés Messi")
                    .font(.footnote)
                    .fontWeight(.medium)
            }
            .padding(.horizontal, 8)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Follow")
                    .foregroundStyle(.black)
                    .font(.footnote)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray3), lineWidth: 2)
                    }
            }
            
        }
    }
}

#Preview {
    UserCell()
}
