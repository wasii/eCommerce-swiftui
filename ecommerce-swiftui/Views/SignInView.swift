//
//  SignInView.swift
//  ecommerce-swiftui
//
//  Created by Abul Jaleel on 30/05/2024.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Image(systemName: "arrow.left")
                .imageScale(.large)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Sign In")
                    .font(.title)
                
                Text("Enter your email address and password and continue shopping.")
                    .font(.callout)
            }
            
            VStack(spacing: 15) {
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
                
                Text("Not having an account? **Signup**")
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .preferredColorScheme(.dark)
    }
}

#Preview {
    SignInView()
}
