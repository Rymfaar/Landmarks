//
//  Profile.swift
//  Landmarks
//
//  Created by ippon on 24/01/2023.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = false
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    static let `default` = Profile(username: "Rymcode")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}
