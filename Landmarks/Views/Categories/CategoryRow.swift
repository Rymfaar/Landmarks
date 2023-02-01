//
//  CategoryRow.swift
//  Landmarks
//
//  Created by ippon on 24/01/2023.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var landmarks: [Landmark]

    var body: some View {
        VStack (alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.top, 5)
                .padding(.leading, 15)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 15) {
                    ForEach(landmarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(
                                image: landmark.image,
                                title: landmark.name
                            )
                        }

                    }
                }
                .padding(.horizontal, 15)
            }
        }
        .frame(height: 185)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static let landmarks = ModelData().landmarks
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            landmarks: landmarks
        )
    }
}
