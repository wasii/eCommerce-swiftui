//
//  OnboardingView.swift
//  ecommerce-swiftui
//
//  Created by Abul Jaleel on 30/05/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var isActive = false
    @State private var isExpand = false
    @State private var offSet = CGSize.zero
    
    var body: some View {
        if isActive {
            SignInView()
        } else {
            ZStack(alignment: .top) {
                VStack {
                    Spacer()
                    Circle()
                        .fill(
                            RadialGradient(colors: [.red, .clear, .clear, .clear], center: .center, startRadius: 0, endRadius: UIScreen.main.bounds.width)
                        )
                        .padding(.bottom, -(UIScreen.main.bounds.width/2))
                        .scaleEffect(isExpand ? 20 : 2)
                }
                .frame(maxHeight: .infinity)
                .zIndex(isExpand ? 2 : 0)
                
                VStack(spacing: 15) {
                    Spacer()
                    Image("sneaker-nike")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Start Journey\nwith NIKE")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                    
                    Text("Smart gorgeous and fashionable collection makes you coll")
                        .multilineTextAlignment(.center)
                        .opacity(0.5)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "chevron.up")
                        Text("Get Started")
                            .padding(.top)
                    }
                    .fontWeight(.medium)
                }
                .opacity(isExpand ? 0 : 1)
                .offset(offSet)
                
            }
            .gesture(
                DragGesture()
                    .onEnded({ value in
                        if value.translation.height < 50 {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                offSet = value.translation
                                isExpand = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation {
                                    isActive.toggle()
                                }
                            }
                        }
                    })
            )
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("red-dots")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    OnboardingView()
}
