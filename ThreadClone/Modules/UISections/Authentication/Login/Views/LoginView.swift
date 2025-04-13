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
    @Binding var isLoggedIn: Bool
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
                .autocapitalization(.none)
                .modifier(TextFiledModifier())
                SecureField(text: $password) {
                    Text("Password")
                }
                .modifier(TextFiledModifier())
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
                    isLoggedIn = true
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
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
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
    @State var isLoggedIn = false
    return LoginView(isLoggedIn: $isLoggedIn)
}
