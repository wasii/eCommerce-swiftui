//
//  Splash.swift
//  ecommerce-swiftui
//
//  Created by Abul Jaleel on 30/05/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct Splash: View {
    
    @State var isActive: Bool = false
    var body: some View {
        VStack {
            if isActive {
                if Auth.auth().currentUser != nil {
                    ContentView()
                } else {
                    OnboardingView()
                }
            } else {
                Text("NIKE")
                    .font(.largeTitle.bold())
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    Splash()
}
