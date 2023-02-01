//
//  CategoryItem.swift
//  Landmarks
//
//  Created by ippon on 24/01/2023.
//

import SwiftUI

struct CategoryItem: View {
    let image: Image
    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(title)
                .font(.caption)
                .foregroundColor(.primary)
        }

    }
}

struct CategoryItem_Previews: PreviewProvider {
    static let landmark = ModelData().landmarks[0]
    static var previews: some View {
        CategoryItem(image: landmark.image, title: landmark.name)
    }
}
