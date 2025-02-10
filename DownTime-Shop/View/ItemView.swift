//
//  ItemView.swift
//  DownTime-Shop
//
//  Created by Remberto Nunez on 2/7/25.
//

import SwiftUI

struct ItemView: View {
    @State var imageURL: String = "https://www.foundations.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/f/o/foundations-little-scholars-kids-school-chairs-12-in-seat-height_main_1.jpg"
    @State var itemName: String = "Name"
    @State var itemPrice: String = "100.00"
    @State var stars: Int = 1
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.white)
            VStack {
                VStack {
                    AsyncImage(url: URL(string: imageURL)){ result in
                        result.image?
                            .resizable()
                            .scaledToFill()
                    }
                    .frame(width: 100, height: 250)
                }
                VStack(alignment: .leading) {
                    Text(itemName)
                        .font(.headline)
                        .padding(.bottom, 8)
                    HStack {
                        ForEach(0..<stars, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        ForEach(0..<5-stars, id: \.self) { _ in
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                        Text("**$\(itemPrice)**")
                            .font(.body)
                    }
                }
            }
            .frame(maxWidth: 230, maxHeight: 330)
        }
        .frame(width: 250, height: 350)
        .padding()
    }
}

#Preview {
    ItemView()
}
