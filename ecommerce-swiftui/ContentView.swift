//
//  ContentView.swift
//  ecommerce-swiftui
//
//  Created by Abul Jaleel on 30/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .toolbarBackground(.visible, for: .tabBar)
            
            Text("Explore")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
            
            Text("Cart")
                .tabItem {
                    Image(systemName: "bag")
                    Text("Bag")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .tint(Color.black)
    }
}

#Preview {
    ContentView()
}
