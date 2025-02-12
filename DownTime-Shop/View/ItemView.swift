//
//  ItemView.swift
//  DownTime-Shop
//
//  Created by Remberto Nunez on 2/7/25.
//

import SwiftUI

struct ItemView: View {
    @State var imageURL: String = "https://images.thdstatic.com/productImages/1b7cf221-cee1-43c4-a021-619b04792c2c/svn/brown-american-furniture-classics-accent-chairs-8501-10-d4_600.jpg"
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
                            .scaledToFit()
                            .frame(width: 230, height: 250)
                            .cornerRadius(25)
                    }
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
