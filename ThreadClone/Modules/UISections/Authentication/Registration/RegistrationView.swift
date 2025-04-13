//
//  RegistrationView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var username: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Image("thread_icon")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            TextField(text: $email) {
                Text("Enter your email")
            }
            .autocapitalization(.none)
            .modifier(TextFiledModifier())
            SecureField(text: $password) {
                Text("Enter your password")
            }
            .modifier(TextFiledModifier())
            
            TextField(text: $fullName) {
                Text("Enter your full name")
            }
            .modifier(TextFiledModifier())
            
            TextField(text: $username) {
                Text("Enter your username")
            }
            .modifier(TextFiledModifier())
            
            Button {
                
            } label: {
                Text("Sign up")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 44)
                    .background(Color.black)
                    .cornerRadius(8)
                    .padding(.top, 8)
                
            }
            
            Spacer()
            
            Divider()
            Button {
                dismiss()
            } label: {
                HStack(spacing : 4) {
                    Text("Already have an account?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("Login")
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .font(.footnote)
                        .fontWeight(.bold)
                }
            }
            .padding(.top, 8)
            
        }
    }
}

#Preview {
    RegistrationView()
}
