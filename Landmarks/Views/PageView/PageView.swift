//
//  PageView.swift
//  Landmarks
//
//  Created by Alexis Beaudoin on 15/02/2023.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0

    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
                .padding(.bottom, 8)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().favorites.map { FavoriteCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
