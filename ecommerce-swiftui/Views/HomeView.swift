//
//  HomeView.swift
//  ecommerce-swiftui
//
//  Created by Abul Jaleel on 30/05/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var currentCategory = "All"
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("**Shoes**\nCollection")
                            .font(.largeTitle)
                        Spacer()
                        
                        Image(systemName: "bell")
                            .padding(.vertical, 25)
                            .padding(.horizontal, 16)
                            .imageScale(.large)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black.opacity(0.05), lineWidth: 3)
                            }
                    }
                    
                    categoriesView
                        .zIndex(1)
                }
                .padding()
            }
        }
    }
    
    var categoriesView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                ForEach(sampleBrands, id: \.self) { item in
                    HStack {
                        if !item.icon.isEmpty {
                            Image(item.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        if currentCategory == item.title || item.title == "All" {
                            Text(item.title)
                        }
                    }
                    .foregroundStyle(currentCategory == item.title ? .white : .black)
                    .padding()
                    .background( currentCategory == item.title ? .black : .gray.opacity(0.08))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation {
                            currentCategory = item.title
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
