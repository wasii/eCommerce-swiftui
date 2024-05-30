//
//  SignInView.swift
//  ecommerce-swiftui
//
//  Created by Abul Jaleel on 30/05/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isLoading = false
    @State private var isSignedIn = false
    
    var body: some View {
        NavigationStack {
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
                    Button {
                        isLoading = true
                        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                            if error != nil {
                                print(error?.localizedDescription ?? "")
                                withAnimation {
                                    isLoading.toggle()
                                }
                            } else {
                                isSignedIn = true
                                let db = Firestore.firestore()
                                db.collection("users").document(result?.user.uid ?? "").getDocument { document, error in
                                    if let document = document, document.exists {
                                        let name = document.get("username") as? String ?? ""
                                        let email = document.get("email") as? String ?? ""
                                        
                                        
                                        UserDefaults.standard.set(name, forKey: "USERNAME")
                                        UserDefaults.standard.set(email, forKey: "EMAIL")
                                        
                                        isLoading.toggle()
                                    } else{
                                        isLoading.toggle()
                                        print("Document not exist")
                                    }
                                }
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
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Not having an account? **Signup**")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(Color.white)
                }
            }
            .padding()
            .preferredColorScheme(.dark)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    SignInView()
}
