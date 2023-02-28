//
//  CategoryHome.swift
//  Landmarks
//
//  Created by ippon on 23/01/2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                header
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(
                        categoryName: key,
                        landmarks: modelData.categories[key]!
                    )
                    .padding(.vertical, 15)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }

    @ViewBuilder
    var header: some View {
        if modelData.favorites != [] {
            PageView(pages: modelData.favorites.map { FavoriteCard(landmark: $0) })
                .aspectRatio(3 / 2, contentMode: .fit)
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
