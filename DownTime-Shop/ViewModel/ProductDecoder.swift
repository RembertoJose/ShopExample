//
//  ProductDecoder.swift
//  DownTime-Shop
//
//  Created by Remberto Nunez on 2/7/25.
//

import Foundation


class DataManager {
    func decodeProduct(from path: String) throws -> [Product] {
        let decoder = JSONDecoder()
        let bundle = Bundle(for: DataManager.self)
        do {
            if let url = bundle.url(forResource: path, withExtension: "json") {
                let rawData =  try Data(contentsOf: url)
                return try decoder.decode([Product].self, from: rawData)
            } else {
                throw URLError(.fileDoesNotExist)
            }
        } catch {
            print(error.localizedDescription)
            throw URLError(.fileDoesNotExist)
        }
    }
    
}
