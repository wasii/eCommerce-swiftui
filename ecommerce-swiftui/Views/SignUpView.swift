//
//  SignUpView.swift
//  ecommerce-swiftui
//
//  Created by Abul Jaleel on 30/05/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct SignUpView: View {
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isLoading = false
    @State private var isSignedIn = false
    
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
                Button {
                    isLoading.toggle()
                    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                        if error != nil {
                            print(error?.localizedDescription ?? "")
                            withAnimation {
                                isLoading.toggle()
                            }
                        } else {
                            isSignedIn = true
                            let db = Firestore.firestore()
                            let data: [String:Any] = [
                                "username": username,
                                "email": email
                            ]
                            
                            UserDefaults.standard.setValue(result?.user.uid, forKey: "UID")
                            UserDefaults.standard.setValue(username, forKey: "USERNAME")
                            UserDefaults.standard.setValue(email, forKey: "EMAIL")
    
                            db.collection("users").addDocument(data: data)
                            isLoading.toggle()
                            isSignedIn = true
                        }
                    }
                } label: {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Continue")
                            .fontWeight(.medium)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(.red)
                .clipShape(Capsule())
                .foregroundStyle(Color.white)
                .navigationDestination(isPresented: $isSignedIn) {
                    ContentView()
                }
                
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
