//
//  CircleImage.swift
//  Landmarks
//
//  Created by ippon on 29/09/2022.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .frame(maxWidth: 260, maxHeight: 260)
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
