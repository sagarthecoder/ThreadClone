//
//  RegistrationView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 13/4/25.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Image("thread_icon")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            TextField(text: $viewModel.email) {
                Text("Enter your email")
            }
            .autocapitalization(.none)
            .modifier(TextFiledModifier())
            SecureField(text: $viewModel.password) {
                Text("Enter your password")
            }
            .modifier(TextFiledModifier())
            
            TextField(text: $viewModel.fullName) {
                Text("Enter your full name")
            }
            .modifier(TextFiledModifier())
            
            TextField(text: $viewModel.username) {
                Text("Enter your username")
            }
            .autocapitalization(.none)
            .textCase(.lowercase)
            .modifier(TextFiledModifier())
            
            Button {
                viewModel.createNewUser()
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
        .alert("Error!", isPresented: Binding<Bool>(
            get: {
                !viewModel.errorMessage.isEmpty
            },
            set: { newValue in
                if !newValue {
                    viewModel.errorMessage = ""
                }
            }
        )) {
            Button("Ok", role: .cancel) {
                viewModel.errorMessage = ""
            }
        } message: {
            Text(viewModel.errorMessage)
                .foregroundStyle(.black)
                .fontWeight(.regular)
        }
    }
}

#Preview {
    RegistrationView()
}
