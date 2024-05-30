//
//  Splash.swift
//  ecommerce-swiftui
//
//  Created by Abul Jaleel on 30/05/2024.
//

import SwiftUI

struct Splash: View {
    
    @State var isActive: Bool = false
    var body: some View {
        VStack {
            if isActive {
                OnboardingView()
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
