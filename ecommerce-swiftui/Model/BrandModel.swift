//
//  BrandModel.swift
//  ecommerce-swiftui
//
//  Created by Abul Jaleel on 30/05/2024.
//

import Foundation

struct BrandModel: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var icon: String
}

var sampleBrands: [BrandModel] = [
    BrandModel(title: "All", icon: ""),
    BrandModel(title: "Nike", icon: "nike"),
    BrandModel(title: "Adidas", icon: "adidas"),
    BrandModel(title: "Puma", icon: "puma")
]
