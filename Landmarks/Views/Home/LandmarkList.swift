//
//  LandmarkList.swift
//  Landmarks
//
//  Created by ippon on 05/10/2022.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly: Bool = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?

    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountain = "Mountains"

        var id: FilterCategory { self }
    }

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly || landmark.isFavorite) // don't understand how that works
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }

    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoriteOnly ? "Favorite \(title)" : title
    }

    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id } )
    }

    var body: some View {
        NavigationView {
            List(selection: $selectedLandmark) {
                #if !os(macOS)
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorite Only")
                }
                #endif
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                           ForEach(FilterCategory.allCases) { category in
                               Text(category.rawValue).tag(category)
                           }
                       }
                       .pickerStyle(.inline)
                        Toggle(isOn: $showFavoriteOnly) {
                            Label("Favorite only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Fitler", systemImage: "slider.horizontal.3")
                    }
                }
            }
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
