//
//  ProductsModel.swift
//  ecommerce-swiftui
//
//  Created by Abul Jaleel on 30/05/2024.
//

import Foundation


struct ProductsModel: Identifiable, Hashable {
    var id: String
    var title: String
    var brand: String
    var description: String
    var images: [String]
    var sizes: [Int]
    var reviews: [ReviewModel]
    var price: Int
}


struct ReviewModel: Identifiable, Hashable {
    var id: String
    var userName: String
    var image: String
    var review: String
    var rating: Int
}


var sampleData: [ProductsModel] = [
    ProductsModel(
        id: "abc",
        title: "X Lows WASABI",
        brand: "Nike",
        description: "Fresh mint comes together with crisp white within the periphery of classic black. WASABI is a portal to a carefree world. Spirited charm that’s true to its namesake, like a sunlit garden with a playful bounce stealing the show.",
        images: ["https://www.wearcomet.com/cdn/shop/files/Lateral-view-2-min.jpg?v=1702447124&width=2890", "https://www.wearcomet.com/cdn/shop/files/zoom-in-shot-min_24ac1420-af38-4d8b-97df-02f717d08307.jpg?v=1702447124&width=2890", "https://www.wearcomet.com/cdn/shop/files/front-3-4-min_af0c7b10-1901-4a8a-b29c-b094d4dbc0ff.jpg?v=1702447124&width=2890", "https://www.wearcomet.com/cdn/shop/files/full-sole-min_385c2393-ca36-4040-9755-2abd3c4240eb.jpg?v=1702447124&width=2890"],
        sizes: [4, 5, 6, 7, 8, 9, 10],
        reviews: [],
        price: 4000
    ),
    ProductsModel(
        id: "abc",
        title: "X Lows TIRAMISU",
        brand: "Adidas",
        description: "Soft and airy. Bitter and sweet. The muted colour duo is rich and effortless to style. TIRAMISU combines chic with timeless and is bound to reign supreme. Funk it up with an added Black shoelace.",
        images: ["https://www.wearcomet.com/cdn/shop/files/Lateral-View-min.jpg?v=1698132182&width=2890", "https://www.wearcomet.com/cdn/shop/files/zoom-details-min.jpg?v=1698132182&width=2890", "https://www.wearcomet.com/cdn/shop/files/front-3-4-min_d9bad47c-6980-4fa1-b9b0-4028fc74da6c.jpg?v=1698132182&width=2890", "https://www.wearcomet.com/cdn/shop/files/sole-view-min_4f75dbce-ba67-4d80-b6ba-e8a0a3ce0f46.jpg?v=1698132182&width=2890"],
        sizes: [6, 7, 8, 9],
        reviews: [],
        price: 4500
    ),
    ProductsModel(
        id: "abc",
        title: "X Lows DARK",
        brand: "Puma",
        description: "A low-top silhouette in a timeless colour. Black upper. Black bottom. Black Spacewalk Sole. DARK is a fusion of mystery and aesthetics. A blend of shadows and subtleties in an obsidian enigma.",
        images: ["https://www.wearcomet.com/cdn/shop/files/lateral-view-min_fad51db4-f58f-4c29-8aac-be96abb394ef.jpg?v=1698136769&width=2890", "https://www.wearcomet.com/cdn/shop/files/zoom-detail-min.jpg?v=1698136769&width=2890", "https://www.wearcomet.com/cdn/shop/files/front-3-4-min_b1357f24-1647-495a-b6d8-624266f72907.jpg?v=1698136769&width=2890", "https://www.wearcomet.com/cdn/shop/files/Sole-view-min_dc4ee38c-b960-482f-a134-9dd7901bc595.jpg?v=1698136769&width=2890"],
        sizes: [3, 4, 5, 6],
        reviews: [],
        price: 4200
    )
]
