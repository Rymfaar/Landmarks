//
//  File.swift
//  Landmarks
//
//  Created by ippon on 03/10/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Model, Hashable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var category: Category

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}

extension Landmark {
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}
