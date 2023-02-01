//
//  ContentView.swift
//  Landmarks
//
//  Created by ippon on 29/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: HomeTab = .featured

    enum HomeTab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(HomeTab.featured)
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(HomeTab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
