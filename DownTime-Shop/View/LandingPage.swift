//
//  ContentView.swift
//  DownTime-Shop
//
//  Created by Remberto Nunez on 2/7/25.
//

import SwiftUI

struct LandingPage: View {
    @State private var searchText = ""
    var arraySubCategory: [String] = ["All", "Chair", "Table", "Bed", "Sofa", "Lamp", "Storage"]
    @StateObject var viewModel = ViewModel()
    @State private var selectedTab: Tabs = .landing
    
    var body: some View {
            NavigationStack {
                ZStack {
                    ScrollView() {
                        VStack(alignment: .leading) {
                            Text("Find the")
                                .font(Font.custom("TimesNewRomanPSMT", size: 30))
                                .foregroundColor(Color.brown)
                            Text("Best **Furniture!**")
                                .font(Font.custom("TimesNewRomanPSMT", size: 30))                .fontDesign(.serif)
                                .foregroundColor(Color.brown)
                            HStack {
                                TextField("   \(Image(systemName: "magnifyingglass")) Search Furniture", text: $searchText)
                                    .font(.body)
                                    .frame(height: 55)
                                    .textFieldStyle(.plain)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.brown)
                                    Image(systemName: "qrcode.viewfinder")
                                        .foregroundColor(Color.white)
                                        .padding()
                                }
                                .frame(width: 50, height: 50)
                            }
                            getSubCategory()
                                .scrollTargetBehavior(.viewAligned)
                                .frame(height: 50)
                            getSection(title: "Popular")
                            getSection(title: "Best")
                        }
                        .padding()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    .task {
                        await viewModel.getProducts()
                    }
                    .background(Color.init(uiColor: UIColor.secondarySystemBackground))
                    
                    TabBarView(selectedTab: $selectedTab)
                        .padding(.top, 730)
                }
            }
        }
    
    @ViewBuilder
    func getSection(title: String) -> some View {
        Text("**\(title)**")
            .font(Font.custom("TimesNewRomanPSMT", size: 30))
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.products) { product in
                    NavigationLink {
                        DetailsPage(title: product.name, stars: product.stars, description: product.description, price: product.price, imageURL: product.imageURL)
                    } label: {
                        ItemView(imageURL: product.imageURL, itemName: product.name, itemPrice: product.price, stars: product.stars)
                    }
                }
            }
            .scrollTargetLayout()
        }
    }
    
    @ViewBuilder
    func getSubCategory() -> some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(arraySubCategory, id: \.self) { item in
                    Text(item)
                        .foregroundColor(Color.gray)
                        .padding()
                }
            }
            .scrollTargetLayout()
        }
    }
}

#Preview {
    LandingPage()
}
