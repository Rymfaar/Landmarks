//
//  FavoriteCard.swift
//  Landmarks
//
//  Created by ippon on 09/02/2023.
//

import SwiftUI

struct FavoriteCard: View {
    var landmark: Landmark

    var body: some View {
        landmark.favoriteImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

struct TextOverlay: View {
    var landmark: Landmark

    var gradient: LinearGradient {
        .linearGradient(Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
                        startPoint: .bottom,
                        endPoint: .top)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FavoriteCard_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCard(landmark: ModelData().landmarks[0])
    }
}
