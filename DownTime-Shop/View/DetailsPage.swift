//
//  DetailsPage.swift
//  DownTime-Shop
//
//  Created by Remberto Nunez on 2/7/25.
//

import SwiftUI

struct DetailsPage: View {
    @State var title = "Text"
    @State var stars = 0
    @State var description = ""
    @State var price = "500"
    @State var imageURL = "https://www.foundations.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/f/o/foundations-little-scholars-kids-school-chairs-12-in-seat-height_main_1.jpg"
    @State private var quanity: Int = 1
    
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: imageURL)){ result in
                result.image?
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 400, height: 300)
            VStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .bold()
                        .padding(.bottom, 5)
                    HStack {
                        ForEach(0..<stars, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        ForEach(0..<5-stars, id: \.self) { _ in
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                        Text("(\(stars))")
                            .foregroundColor(Color.gray)
                    }
                    .padding(.bottom, 5)
                    HStack {
                        Text ("Description")
                            .font(.headline)
                        Text ("Review")
                            .font(.headline)
                            .foregroundColor(Color.brown)
                    }
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 10)
                }
                VStack(alignment: .leading) {
                    HStack(alignment: .top, spacing: 130) {
                        VStack(alignment: .leading) {
                            Text("Size")
                                .font(.headline)
                                .padding(.bottom, 1)
                            Text("Height: 120cm")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .padding(.bottom, 1)
                            Text("Wide: 80cm")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .padding(.bottom, 1)
                            Text("Diameter: 72cm")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .padding(.bottom, 1)
                        }
                        VStack(alignment: .leading) {
                            Text("Treatement")
                                .font(.headline)
                                .padding(.bottom, 1)
                            Text("Jati Wood, Canvas")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .padding(.bottom, 1)
                            Text("Amazing Love")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .padding(.bottom, 1)
                        }
                    }
                }
                VStack(alignment: .leading) {
                    HStack(alignment: .top, spacing: 90) {
                        VStack(alignment: .leading) {
                            Text("Color")
                                .font(.headline)
                                .padding(.bottom, 1)
                            HStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 30, height: 30)
                                    .padding(.bottom, 1)
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 30, height: 30)
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 30, height: 30)
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 30, height: 30)
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("Quantity")
                                .font(.headline)
                                .padding(.bottom, 1)
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color.brown)
                                        .frame(width: 30, height: 30)
                                        .padding(.bottom, 1)
                                    Button {
                                        if quanity != 0 {
                                            self.quanity-=1
                                        }
                                    } label: {
                                        Image(systemName: "minus")
                                            .foregroundColor(.white)
                                    }
                                }
                                Text("\(quanity)")
                                    .font(.headline)
                                ZStack {
                                    Circle()
                                        .fill(Color.brown)
                                        .frame(width: 30, height: 30)
                                        .padding(.bottom, 1)
                                    Button {
                                        self.quanity+=1
                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.trailing, 50)
                }
            }
            .padding()
        }
        .background(Color.init(uiColor: UIColor.secondarySystemBackground))
        ZStack {
            Rectangle()
                .fill(Color.brown)
                .frame(width: 403, height: 50)
                .cornerRadius(40)
            HStack(alignment: .center) {
                Text("$\(price)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 150, height: 40)
                        .cornerRadius(10)
                    Button("Add to Cart") {
                        print("Button Pressed")
                    }
                    .font(.headline)
                    .foregroundColor(.brown)
                }
                .padding(.trailing, 20)
            }
        }
        .background(Color.brown)
    }
}

#Preview {
    DetailsPage()
}
