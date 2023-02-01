//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by ippon on 30/01/2023.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile

    var body: some View {
        List {
            Text("Profile Editor")
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
