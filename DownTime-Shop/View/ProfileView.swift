//
//  Profile.swift
//  DownTime-Shop
//
//  Created by Remberto Nunez on 2/11/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedTab: Tabs = .profile
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            TabBarView(selectedTab: $selectedTab)
                .padding(.top, 730)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.init(uiColor: UIColor.secondarySystemBackground))
    }

}

#Preview {
    ProfileView()
}
