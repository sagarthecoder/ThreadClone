//
//  EditProfileView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct EditProfileView: View {
    @State var bio = ""
    @State var link = ""
    @State var isPrivateProfile: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea(.all)
                VStack(spacing : 8) {
                    // Name
                    HStack {
                        VStack(alignment : .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text("Leonel Messi")
                        }
                        
                        Spacer()
                        
                        CircularImageView()
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
                            Text("Edit Bio")
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
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    
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
