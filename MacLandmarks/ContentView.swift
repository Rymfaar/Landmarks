//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Alexis Beaudoin on 28/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList().frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
