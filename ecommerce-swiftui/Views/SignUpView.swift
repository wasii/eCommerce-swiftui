//
//  SignUpView.swift
//  ecommerce-swiftui
//
//  Created by Abul Jaleel on 30/05/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Button{
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
            }
            .foregroundStyle(Color.white)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Sign Up")
                    .font(.title)
                
                Text("Enter your email address and password and continue shopping.")
                    .font(.callout)
            }
            
            VStack(spacing: 15) {
                TextField("Username", text: $username)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(.gray.opacity(0.2))
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(.gray.opacity(0.8), lineWidth: 0.8)
                    )
                
                TextField("Email Address", text: $email)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(.gray.opacity(0.2))
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(.gray.opacity(0.8), lineWidth: 0.8)
                    )
                
                SecureField("Password", text: $password)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(.gray.opacity(0.2))
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(.gray.opacity(0.8), lineWidth: 0.8)
                    )
            }
            
            Spacer()
            
            VStack(spacing: 15) {
                Button {} label: {
                    Text("Continue")
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(.red)
                .clipShape(Capsule())
                .foregroundStyle(Color.white)
                
                Button {
                    dismiss()
                } label: {
                    Text("Already have an account? **Signin**")
                        .frame(maxWidth: .infinity)
                }
                .foregroundStyle(Color.white)
            }
        }
        .padding()
        .preferredColorScheme(.dark)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    SignUpView()
}
