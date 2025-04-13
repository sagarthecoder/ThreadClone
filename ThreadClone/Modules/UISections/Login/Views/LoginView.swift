//
//  LoginView.swift
//  ThreadClone
//
//  Created by Sagar Chandra Das on 12/4/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("thread_icon")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                TextField(text: $email) {
                    Text("Email")
                }
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                SecureField(text: $password) {
                    Text("Password")
                }
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                NavigationLink{
                    Text("")
                } label : {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .padding(.vertical)
                        .padding(.trailing, 14)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    
                } label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 48)
                        .background(Color.black)
                        .cornerRadius(8)
                    
                }
                
                
                Spacer()
                
                Divider()
                NavigationLink {
                    Text("")
                } label: {
                    HStack(spacing : 4) {
                        Text("Don't have an account?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
