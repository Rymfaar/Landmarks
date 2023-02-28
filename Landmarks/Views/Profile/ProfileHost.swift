//
//  ProfileHost.swift
//  Landmarks
//
//  Created by ippon on 24/01/2023.
//

import SwiftUI

struct ProfileHost: View {
    @EnvironmentObject var modelData: ModelData
    @State private var isEditing = false
    @State private var draftProfile = Profile.default

    var body: some View {
        NavigationView {
            VStack {
                if isEditing {
                    ProfileEditor(profile: $draftProfile)
                        .onAppear {
                            draftProfile = modelData.profile
                        }
                        .onDisappear{
                            modelData.profile = draftProfile
                        }
                } else {
                    ProfileSummary(profile: modelData.profile)
                        .padding()
                }
            }
            .navigationBarTitle(isEditing ? "Edit Profile" : "Profile", displayMode: .inline)
            .navigationBarItems(leading: isEditing ? Button("Cancel") {
                draftProfile = modelData.profile
                self.isEditing.toggle()
            } : nil,
                                trailing: Button(isEditing ? "Done" : "Edit") {
                self.isEditing.toggle()
            })
        }
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
