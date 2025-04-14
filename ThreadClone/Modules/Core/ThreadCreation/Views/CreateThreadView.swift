//
//  CreateThreadView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct CreateThreadView: View {
    var user : User?
    @State var caption = ""
    @StateObject var viewModel = CreateThreadViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment : .top, spacing : 10) {
                    CircularImageView()
                    VStack(alignment : .leading, spacing : 1) {
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        TextField("Create a new thread...", text: $caption, axis: .vertical)
                    }
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.gray)
                        }

                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle(Text("Create Thread"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    } label: {
                        Text("Post")
                            .opacity(caption.isEmpty ? 0.5 : 1)
                            .disabled(caption.isEmpty)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        CreateThreadView()
    }
}
