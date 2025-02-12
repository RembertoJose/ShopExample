//
//  TabBarView.swift
//  DownTime-Shop
//
//  Created by Remberto Nunez on 2/11/25.
//

import SwiftUI

enum Tabs {
    case landing
    case favorites
    case cart
    case profile
}

struct TabBarView: View {
    
    @Binding var selectedTab: Tabs
    @State var showLandingPage: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(30)
            HStack(alignment: .center, spacing: 55) {
                selectionButton(selectedTab: .landing, selectedView: LandingPage(), image: "house")
                selectionButton(selectedTab: .favorites, selectedView: FavoriteView(), image: "heart")
                selectionButton(selectedTab: .cart, selectedView: CartView(), image: "cart")
                selectionButton(selectedTab: .profile, selectedView: ProfileView(), image: "person")
            }
        }
        .frame(maxWidth: 380, maxHeight: 60)
    }
    
    @ViewBuilder
    func selectionButton(selectedTab: Tabs, selectedView: some View, image: String ) -> some View {
        Button {
            self.selectedTab = selectedTab
            print(selectedView)
            showLandingPage.toggle()
        } label: {
            if selectedTab == self.selectedTab {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .bold()
                    .foregroundColor(.brown)
                    .frame(width: 30, height: 30)
            } else {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: 30, height: 30)
            }
        }
        .fullScreenCover(isPresented: $showLandingPage) {
            selectedView
        }
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.landing))
}
