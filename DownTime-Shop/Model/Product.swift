//
//  Model.swift
//  DownTime-Shop
//
//  Created by Remberto Nunez on 2/7/25.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: String
    let name: String
    let price: String
    let imageURL: String
    let stars: Int
    let description: String
}
