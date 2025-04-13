//
//  ThreadCell.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    CircularImageView(imageName: "messi")
                    
                    VStack(alignment : .leading, spacing : 4) {
                        HStack {
                            Text("messiTheCoder")
                                .fontWeight(.semibold)
                            Spacer()
                            Text("10ms")
                                .font(.footnote)
                                .foregroundStyle(Color(.systemGray3))
                            Button {
                                
                            } label: {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.black)
                            }

                        }
                        
                        Text("Messi is the ultimate goal scorer")
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        HStack(spacing : 16) {
                            Button {
                                
                            } label: {
                                Image(systemName: "heart")
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "bubble.right")
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "arrow.rectanglepath")
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "paperplane")
                                    .foregroundStyle(Color(.darkGray))
                            }

                        }
                        .tint(.black)
                            
                    }
                    .padding(.horizontal, 4)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ThreadCell()
}
