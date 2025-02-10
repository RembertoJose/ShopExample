//
//  ViewModel.swift
//  DownTime-Shop
//
//  Created by Remberto Nunez on 2/7/25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    @MainActor
    func getProducts() async {
        let dataManager = DataManager()
        do {
            self.products = try dataManager.decodeProduct(from: "products")
        } catch {
            print(error.localizedDescription)
        }
    }
}
