//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by ippon on 03/10/2022.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image.resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: ModelData().landmarks[0])
            LandmarkRow(landmark: ModelData().landmarks[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
