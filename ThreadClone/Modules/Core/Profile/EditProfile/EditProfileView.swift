//
//  EditProfileView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State var bio = ""
    @State var link = ""
    @State var isPrivateProfile: Bool = false
    @EnvironmentObject var viewModel : CurrentUserProfileViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea(.all)
            VStack(spacing : 8) {
                // Name
                HStack {
                    VStack(alignment : .leading) {
                        Text("Name")
                            .fontWeight(.semibold)
                        Text(viewModel.user?.fullName ?? "")
                    }
                    
                    Spacer()
                    
                    PhotosPicker(selection: $viewModel.selectedItem) {
                        if let profileImage = viewModel.profileImage {
                            profileImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(.circle)
                        } else {
                            CircularImageView()
                        }
                    }
                }
                
                Divider()
                
                // Bio
                VStack(alignment : .leading) {
                    Text("Bio")
                        .fontWeight(.semibold)
                    TextField(text: $bio, axis: .vertical) {
                        Text("Edit Bio")
                    }
                }
                
                Divider()
                
                VStack(alignment : .leading) {
                    Text("Link")
                        .fontWeight(.semibold)
                    TextField(text: $link, axis: .vertical) {
                        Text("Edit Link")
                    }
                }
                
                Divider()
                
                Toggle("Private Profile", isOn: $isPrivateProfile)
                
            }
            .font(.footnote)
            .padding()
            .background(Color.white)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            }
            .padding()
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Text("Done")
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}


#Preview {
    NavigationStack {
        EditProfileView()
    }
}
